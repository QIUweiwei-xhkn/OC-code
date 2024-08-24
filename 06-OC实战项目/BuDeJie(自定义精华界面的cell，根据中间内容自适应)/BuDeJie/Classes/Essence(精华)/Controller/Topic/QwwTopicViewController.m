//
//  QwwTopicViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/24.
//

#import "QwwTopicViewController.h"
#import "AFNetworking.h"
#import "QwwTopicItem.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "QwwTopicCell.h"
#import "SDImageCache.h"
#import "QwwNormalHeaderView.h"

//#import "QwwAllViewController.h"
//#import "QwwVideoViewController.h"
//#import "QwwVoiceViewController.h"
//#import "QwwPictureViewController.h"
//#import "QwwWordViewController.h"

#import "MJRefresh.h"

@interface QwwTopicViewController ()
///** 下拉刷新控件  */
//@property(nonatomic, weak) UIView *header;
///**  下拉刷新控件 的文字   */
//@property(nonatomic, weak) UILabel *headerLable;
///** 下拉刷新控件时是否正在更新   */
//@property(nonatomic, assign, getter=isheaderRefreshing) BOOL headerRefreshing;

/** 上拉刷新控件  */
@property(nonatomic, weak) UIView *footer;
/**  上拉刷新控件 的文字   */
@property(nonatomic, weak) UILabel *footerLable;
/** 上拉刷新控件时是否正在更新   */
@property(nonatomic, assign, getter=isfooterRefreshing) BOOL footerRefreshing;

/** tableviwe的数据个数   */
@property(nonatomic, assign) NSInteger Celldata;
/** 初始偏移量   */
@property(nonatomic, assign) CGFloat originOffsetY;
/** 所有的帖子数据   */
@property(nonatomic, strong) NSMutableArray<QwwTopicItem *> *topics;

/** 用来缓存cell的高度数据（key：模型  value：高度）   */
//@property(nonatomic, strong) NSMutableDictionary *cellHeightDict;
@end

static NSString * const QwwTopicCellID = @"QwwTopicCell";

@implementation QwwTopicViewController
//- (NSMutableDictionary *)cellHeightDict {
//    if(_cellHeightDict == nil) {
//        _cellHeightDict = [NSMutableDictionary dictionary];
//    }
//    return _cellHeightDict;
//}

- (NSMutableArray *)topics {
    if(_topics == nil) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QColor(206, 206, 206);
    self.tableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, -35);
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 200;
    
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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QwwTopicCell class]) bundle:nil] forCellReuseIdentifier:QwwTopicCellID ];
    
    // 设置上拉刷新栏
    [self setupRefresh];
}

- (void)setupRefresh {
    CGFloat scrollWidth =XMGScreenW;
    
//    // header
//    UIView *headView = [[UIView alloc] init];
//    headView.frame = CGRectMake(0, -50, scrollWidth, 50);
//    UILabel *headLable = [[UILabel alloc] initWithFrame:headView.bounds];
//    headLable.backgroundColor = [UIColor blueColor];
//    headLable.text = @"下拉加载更多";
//    headLable.textAlignment = NSTextAlignmentCenter;
//    headLable.textColor = [UIColor whiteColor];
//    [headView addSubview:headLable];
//    self.headerLable = headLable;
//    self.header = headView;
//    [self.tableView addSubview:headView];
//    // 让header自动刷新
//    [self headerBeginRefreshing];
    
    // header
    MJRefreshNormalHeader *header = [QwwNormalHeaderView headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    [header beginRefreshing];
    self.tableView.mj_header = header;
    
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
//    [self dealHeader];
    // 处理上拉刷新控件
    [self dealFooter];
    
    // 清除缓存
    // 清除沙盒中所有使用SD缓存的图片
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    
    // 清除沙盒中所有使用SD缓存的图片
    [[SDImageCache sharedImageCache] clearMemory];
}

/// 用户松开scrollView的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 判断是否是加载数据状态，是的话，直接返回
    //    if(self.headerRefreshing) return;
    
    // 判断是否进入下拉刷新状态
//    CGFloat offsetX = - (self.originOffsetY + self.header.qww_height);
//    if(self.tableView.contentOffset.y <= offsetX) {
//        // 进入下拉刷新状态
//        [self headerBeginRefreshing];
//    }
}

// 处理下拉刷新控件
//- (void)dealHeader {
//    // 判断是否是加载数据状态，是的话，直接返回
//    if(self.headerRefreshing) return;
//    
//    CGFloat offsetX = - (self.originOffsetY + self.header.qww_height);
//    
//    if(self.tableView.contentOffset.y <= offsetX) {
//        self.headerLable.text = @"松开立即刷新";
//        self.headerLable.backgroundColor = [UIColor grayColor];
//    }else {
//        self.headerLable.backgroundColor = [UIColor blueColor];
//        self.headerLable.text = @"下拉加载更多";
//    }
//}

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
//    [self headerBeginRefreshing];
}

/// 监听titleButto重复点击
- (void)titleButtoDidRepeateClick {
    //    if(显示在正中间的tableView不是allTableView) return;
    if(!self.tableView.scrollsToTop) return;
    // 刷新数据
    [self headerBeginRefreshing];
}

#pragma mark - Table view data source
/*
 这个方法的特点：
 1.默认情况下, 每当有cell进入屏幕范围内，就会调用一次这个方法
 避免重复加载已经存在的数据，可以采用一一对应的样式验证是否已经保存过， 方法：1.字典保存， 2.每个模型额外加一个属性保存数据（推荐）
 */
// 方法一：字典
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    QwwTopicItem *topic = self.topics[indexPath.row];
//    NSString *key = [NSString stringWithFormat:@"%p", topic]; // 标识topic唯一新的字符串，字符串遵守nsCoding协议
//    CGFloat cellHeight = [self.cellHeightDict[key] doubleValue];
//    if(cellHeight == 0) {
//        // 文字的y值
//        cellHeight += 35 + 2 * QwwMargin;
//
//        // 文字的高度
//        CGSize maxSize = CGSizeMake(XMGScreenW - 2 * QwwMargin, MAXFLOAT);
//    //    cellHeight += [topic.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:maxSize].height + QwwMargin;
//        cellHeight += [topic.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height + QwwMargin;
//
//        // 工具条
//        cellHeight += 35 + QwwMargin;
//
//        // 存高度
//        self.cellHeightDict[key] = @(cellHeight);
////        [self.cellHeightDict setObject:@(cellHeight) forKey:key];
//        NSLog(@"%zd -- %f", indexPath.row, cellHeight);
//    }
//    return cellHeight;
//}
// 这两个方法只能获得单行文字的宽高
//   [topic.text sizeWithFont:[UIFont systemFontOfSize:15]].width;
//    [UIFont systemFontOfSize:15].lineHeight;

// 方法二：模型加属性
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    QwwTopicItem *topic = self.topics[indexPath.row];
//    return topic.cellHeight;
    
//    return [self.topics[indexPath.row] cellHeight];
    return self.topics[indexPath.row].cellHeight;
}


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
    QwwTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:QwwTopicCellID];

    cell.topic = topic;
    
    return cell;
}

#pragma mark - header
- (void)headerBeginRefreshing {
    // 判断是否是上拉状态， 是的话直接返回
//    if(self.footerRefreshing) return;
//    // 判断是否是加载数据状态，是的话，直接返回
//    if(self.headerRefreshing) return;
//    
//    self.headerRefreshing = YES;
//    self.headerLable.text = @"正在加载新的数据……";
//    self.headerLable.backgroundColor = [UIColor redColor];
//    
//    // 增加内边距，在刷新数据的时候停留
//    [UIView animateWithDuration:0.25 animations:^{
//        UIEdgeInsets insets = self.tableView.contentInset;
//        insets.top += self.header.qww_height;
//        self.tableView.contentInset = insets;
//    }];
//    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, -self.originOffsetY - self.header.qww_height);
    
    [self loadNewData];
}

- (void)headerEndRefreshing {
//    [UIView animateWithDuration:0.25 animations:^{
//        UIEdgeInsets insets = self.tableView.contentInset;
//        insets.top -= self.header.qww_height;
//        self.tableView.contentInset = insets;
//    }];
//    self.headerLable.backgroundColor = [UIColor blueColor];
//    self.headerLable.text = @"下拉加载更多";
//    self.headerRefreshing = NO;
}

#pragma mark - footer
- (void)footerBeginRefreshing {
    // 是否是下拉刷新状态
//    if(self.headerRefreshing) return;
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
//- (QwwTopicType)type {
////    if([self isKindOfClass:[QwwAllViewController class]]) return QwwTopicTypeAll;
////    if([self isKindOfClass:[QwwPictureViewController class]]) return QwwTopicTypePicture;
////    if([self isKindOfClass:[QwwWordViewController class]]) return QwwTopicTypeWord;
////    if([self isKindOfClass:[QwwVideoViewController class]]) return QwwTopicTypeVideo;
////    if([self isKindOfClass:[QwwVoiceViewController class]]) return QwwTopicTypeVoice;
//    
////    if(self.class == [QwwAllViewController class]) return QwwTopicTypeAll;
//    
////    if([NSStringFromClass(self.class) isEqualToString:@"QwwAllViewController"]) return QwwTopicTypeAll; 
//    return 0;
//}

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
    self.topics = [QwwTopicItem mj_objectArrayWithKeyValuesArray:dataArr];
    
    // 清除之前计算的高度
//    [self.cellHeightDict removeAllObjects];
    
    // 减少内边距，结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 服务器请求的数据回来了
        self.Celldata = self.topics.count;
        [self.tableView reloadData];
        
        // 结束刷新
//        [self headerEndRefreshing];
        [self.tableView.mj_header endRefreshing];
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
