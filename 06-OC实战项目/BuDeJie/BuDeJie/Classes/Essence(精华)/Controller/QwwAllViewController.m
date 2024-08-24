//
//  QwwAllViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/16.
//

#import "QwwAllViewController.h"
#import "AFNetworking.h"
#import "QwwTopicItem.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "QwwTopicCell.h"
#import "QwwVideoCell.h"
#import "QwwVoiceCell.h"
#import "QwwWordCell.h"
#import "QwwPictureCell.h"

@interface QwwAllViewController ()
/** 下拉刷新控件  */
@property(nonatomic, weak) UIView *header;
/**  下拉刷新控件 的文字   */
@property(nonatomic, weak) UILabel *headerLable;
/** 上拉刷新控件  */
@property(nonatomic, weak) UIView *footer;
/**  上拉刷新控件 的文字   */
@property(nonatomic, weak) UILabel *footerLable;
/** 上拉刷新控件时是否正在更新   */
@property(nonatomic, assign, getter=isfooterRefreshing) BOOL footerRefreshing;
/** 下拉刷新控件时是否正在更新   */
@property(nonatomic, assign, getter=isheaderRefreshing) BOOL headerRefreshing;
/** tableviwe的数据个数   */
@property(nonatomic, assign) NSInteger Celldata;
/** 初始偏移量   */
@property(nonatomic, assign) CGFloat originOffsetY;
/** 所有的帖子数据   */
@property(nonatomic, strong) NSMutableArray *topics;
@end

static NSString * const QwwPictureCellID = @"QwwPictureCell";
static NSString * const QwwWordCellID = @"QwwWordCell";
static NSString * const QwwVoiceCellID = @"QwwVoiceCell";
static NSString * const QwwVideoCellID = @"QwwVideoCell";

@implementation QwwAllViewController
- (NSMutableArray *)topics {
    if(_topics == nil) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QRrandColor;
    self.tableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, -35);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarButtonDidRepeateClick) name:QWWtabBarButtonDidRepeatClickNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleButtoDidRepeateClick) name:QWWtitleButtonDidRepeatClickNotification object:nil];
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        self.Celldata = 5;
    //        [self.tableView reloadData];
    //        self.footerRefreshing = NO;
    //
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //            self.Celldata = 0;
    //            [self.tableView reloadData];
    //        });
    //    });
    
    //    self.Celldata = 10;
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    // 132 是 97（导航条底端到视图顶的距离）+ 35（标题栏的高度）
    self.originOffsetY = 132;
    
    // 注册
    [self.tableView registerClass:[QwwPictureCell class] forCellReuseIdentifier:QwwPictureCellID];
    [self.tableView registerClass:[QwwWordCell class] forCellReuseIdentifier:QwwWordCellID];
    [self.tableView registerClass:[QwwVoiceCell class] forCellReuseIdentifier:QwwVoiceCellID];
    [self.tableView registerClass:[QwwVideoCell class] forCellReuseIdentifier:QwwVideoCellID];
    
    // 设置上拉刷新栏
    [self setupRefresh];
}

- (void)setupRefresh {
    
    // header
    UIView *headView = [[UIView alloc] init];
    CGFloat scrollWidth = [UIApplication sharedApplication].keyWindow.frame.size.width;
    headView.frame = CGRectMake(0, -50, scrollWidth, 50);
    UILabel *headLable = [[UILabel alloc] initWithFrame:headView.bounds];
    headLable.backgroundColor = [UIColor blueColor];
    headLable.text = @"下拉加载更多";
    headLable.textAlignment = NSTextAlignmentCenter;
    headLable.textColor = [UIColor whiteColor];
    [headView addSubview:headLable];
    self.headerLable = headLable;
    self.header = headView;
    [self.tableView addSubview:headView];
    // 让header自动刷新
    [self headerBeginRefreshing];
    
    // 广告条
    UILabel *adLabel = [[UILabel alloc] init];
    adLabel.frame = CGRectMake(0, 0, 0, 30);
    adLabel.backgroundColor = [UIColor blackColor];
    adLabel.text = @"广告";
    adLabel.textColor = [UIColor whiteColor];
    adLabel.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableHeaderView = adLabel;
    
    // footer
    UIView *footView = [[UIView alloc] init];
    footView.frame = CGRectMake(0, 0, scrollWidth, 40);
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, 40)];
    lable.backgroundColor = [UIColor blueColor];
    lable.text = @"上拉加载更多";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    [footView addSubview:lable];
    self.footerLable = lable;
    self.footer = footView;
    self.tableView.tableFooterView = footView;
    
    
}

#pragma mark - 代理方法
// scrollView滚动的时候掉调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 处理下拉刷新控件
    [self dealHeader];
    // 处理上拉刷新控件
    [self dealFooter];
}

/// 用户松开scrollView的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 判断是否是加载数据状态，是的话，直接返回
    //    if(self.headerRefreshing) return;
    
    // 判断是否进入下拉刷新状态
    CGFloat offsetX = - (self.originOffsetY + self.header.qww_height);
    if(self.tableView.contentOffset.y <= offsetX) {
        // 进入下拉刷新状态
        [self headerBeginRefreshing];
    }
}

// 处理下拉刷新控件
- (void)dealHeader {
    // 判断是否是加载数据状态，是的话，直接返回
    if(self.headerRefreshing) return;
    
    CGFloat offsetX = - (self.originOffsetY + self.header.qww_height);
    
    if(self.tableView.contentOffset.y <= offsetX) {
        self.headerLable.text = @"松开立即刷新";
        self.headerLable.backgroundColor = [UIColor grayColor];
    }else {
        self.headerLable.backgroundColor = [UIColor blueColor];
        self.headerLable.text = @"下拉加载更多";
    }
}

// 处理上拉刷新控件
- (void)dealFooter {
    // 当tableView中还没有任何内容的时候，不需要判断
    if(self.tableView.contentSize.height - self.tableView.tableFooterView.qww_height == 0) return;
    // 如果正在刷新，直接返回
    //    if(self.footerRefreshing) return;
    
    // 当scrollview的偏移量 >= offsetX 的时候，代表tableview的尾部视图完全出现
    CGFloat offsetX = self.tableView.contentSize.height + self.tableView.contentInset.top + self.tableView.tableFooterView.qww_height -  self.tableView.qww_height;
    if(offsetX < 0) offsetX = - self.originOffsetY;
    if(self.tableView.contentOffset.y >= offsetX) {
        // 进入刷新数据
        [self footerBeginRefreshing];
    }
}

#pragma mark - 监听
/// 监听tabBarButton重复点击
- (void)tabBarButtonDidRepeateClick {
    //    if(重复点击的不是精华控制器) return;
    // 如果重复点击的不是精华控制器，当前现实的控制器就不是精华控制器，那么self.view.window为空
    if(self.view.window == nil) return;
    //    if(显示在正中间的tableView不是allTableView) return;
    if(!self.tableView.scrollsToTop) return;
    // 刷新数据
    [self headerBeginRefreshing];
}

/// 监听titleButto重复点击
- (void)titleButtoDidRepeateClick {
    //    if(显示在正中间的tableView不是allTableView) return;
    if(!self.tableView.scrollsToTop) return;
    // 刷新数据
    [self headerBeginRefreshing];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.footer.hidden = (self.Celldata == 0);
    return self.topics.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    QwwTopicItem *topicItem = self.topics[indexPath.row];
//    cell.textLabel.text = topicItem.name;
//    cell.detailTextLabel.text = topicItem.text;
//    cell.backgroundColor = [UIColor clearColor];
    
    QwwTopicItem *topic = self.topics[indexPath.row];
    QwwTopicCell *cell = nil;
    if(topic.type == QwwTopicTypePicture) {  // 图片
        cell = [tableView dequeueReusableCellWithIdentifier:@"QwwPictureCell"];
    }else if(topic.type == QwwTopicTypeWord) {  // 段子
        cell = [tableView dequeueReusableCellWithIdentifier:@"QwwWordCell"];
    }else if(topic.type == QwwTopicTypeVoice) {  // 声音
        cell = [tableView dequeueReusableCellWithIdentifier:@"QwwVoiceCell"];
    }else if(topic.type == QwwTopicTypeVideo) {  // 视频
        cell = [tableView dequeueReusableCellWithIdentifier:@"QwwVideoCell"];
    }
    cell.topic = topic;
    
    return cell;
}

#pragma mark - header
- (void)headerBeginRefreshing {
    // 判断是否是上拉状态， 是的话直接返回
    if(self.footerRefreshing) return;
    // 判断是否是加载数据状态，是的话，直接返回
    if(self.headerRefreshing) return;
    
    self.headerRefreshing = YES;
    self.headerLable.text = @"正在加载新的数据……";
    self.headerLable.backgroundColor = [UIColor redColor];
    
    // 增加内边距，在刷新数据的时候停留
    [UIView animateWithDuration:0.25 animations:^{
        UIEdgeInsets insets = self.tableView.contentInset;
        insets.top += self.header.qww_height;
        self.tableView.contentInset = insets;
    }];
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, -self.originOffsetY - self.header.qww_height);
    
    [self loadNewData];
}

- (void)headerEndRefreshing {
    [UIView animateWithDuration:0.25 animations:^{
        UIEdgeInsets insets = self.tableView.contentInset;
        insets.top -= self.header.qww_height;
        self.tableView.contentInset = insets;
    }];
    self.headerLable.backgroundColor = [UIColor blueColor];
    self.headerLable.text = @"下拉加载更多";
    self.headerRefreshing = NO;
}

#pragma mark - footer
- (void)footerBeginRefreshing {
    // 是否是下拉刷新状态
    if(self.headerRefreshing) return;
    // 如果正在刷新，直接返回
    if(self.footerRefreshing) return;
    
    // 进入刷新数据
    self.footerRefreshing = YES;
    self.footerLable.text = @"正在加载更多数据……";
    self.footerLable.backgroundColor = [UIColor redColor];
    
    [self loadMoreData];
}

- (void)footerEndRefreshing {
    self.footerRefreshing = NO;
    self.footerLable.text = @"上拉加载更多";
    self.footerLable.backgroundColor = [UIColor blueColor];
}

#pragma mark - 数据处理
//发送给请求给服务器，下拉刷新数据
- (void)loadNewData {
    NSLog(@"发送请求给服务器 -- 下拉加载新的数据");
//    // 1.创建会话管理者
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    // 2.拼接参数
//    NSMutableDictionary *parmanters = [NSMutableDictionary dictionary];
//    parmanters[@"a"] = @"tag_commnet";
//    parmanters[@"c"] = @"tag_commnet";
//    parmanters[@"de"] = @"tag_commnet";
//    // 3.发送请求
//    [manager GET:@"网络请求路径" parameters:parmanters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
//        [responseObject writeToFile:@"/Users/weiwei/Desktop/loadNewData.plist" atomically:YES];
//        // 刷新表格
//        [self.tableView reloadData];
//        // 结束刷新
//        [self headerEndRefreshing];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"发送请求失败 %@", error);
//        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试……"];
//        // 结束刷新
//        [self headerEndRefreshing];
//    }];
    
    // 字典模型 转 数组模型
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topics.plist" ofType:nil];
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:path];
    NSArray *arr = [QwwTopicItem mj_objectArrayWithKeyValuesArray:dataArr];
    [self.topics addObjectsFromArray:arr];
    
    // 减少内边距，结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 服务器请求的数据回来了
        self.Celldata = self.topics.count;
        [self.tableView reloadData];
        
        // 结束刷新
        [self headerEndRefreshing];
    });
}

//发送给请求给服务器，上拉加载更多数据
- (void)loadMoreData {
    // 发送请求给服务器
    NSLog(@"发送请求给服务器 --- 上拉加载更多数据");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 服务器请求数据回来
        // 字典模型 转 数组模型
        NSString *path = [[NSBundle mainBundle] pathForResource:@"topics.plist" ofType:nil];
        NSArray *dataArr = [NSArray arrayWithContentsOfFile:path];
        NSArray *arr = [QwwTopicItem mj_objectArrayWithKeyValuesArray:dataArr];
        [self.topics addObjectsFromArray:arr];
        
        [self.tableView reloadData];
        // 结束刷新
        [self footerEndRefreshing];
    });
}
@end
