//
//  QwwMeViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/8.
//

#import "QwwMeViewController.h"
#import "QwwSettingTableViewController.h"
#import "QwwSquareItem.h"
#import "QwwSquareCollectionViewCell.h"
//#import <SafariServices/SafariServices.h>
#import "QwwWebViewController.h"

/*
    搭建基本结构 -> 设置底部条 -> 设置顶部条  -> 设置顶部条标签大小 -> 处理导航导航控制器业务逻辑（跳转）
 */

// 设置cell的尺寸
static NSString * const ID = @"cell";
static NSInteger const cols = 4;
static CGFloat margin = 1;
#define itemWH (XMGScreenW - (cols - 1) * margin )/ cols

//@interface QwwMeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SFSafariViewControllerDelegate>
@interface QwwMeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, strong) NSMutableArray *squares;
@property(nonatomic, weak) UICollectionView *collectionView;
@end

@implementation QwwMeViewController
- (NSMutableArray *)squares {
    if(_squares == nil) {
        _squares = [NSMutableArray array];
    }
    return _squares;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航条
    [self setuptabBar];
    
    // 设置tableView底部视图
    [self setupFootView];
    
    // 加载数据  展示方块内容 ->请求数据（查看接口文档）
    [self loadData];
    
    // 处理cell间距，默认tableView分组样式，有额外头部和尾部间距
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    
}

#pragma mark - 加载数据
- (void)loadData {
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"square.plist" ofType:nil];
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:dataPath];
    NSDictionary *dataArr = dataDic[@"square_list"];
    // 将字典数组转模型数组
    _squares = [QwwSquareItem mj_objectArrayWithKeyValuesArray:dataArr];
    
    // 处理数据 避免出现“缺角”
    [self resolveData];
    
    // 设置collectionView，计算collectionView的高度 = row * itemWH
    // rows = (count - 1) / cols + 1
    NSInteger count = _squares.count;
    NSInteger rows = (count - 1) / cols + 1;
    // 设置collectionView的高度
    self.collectionView.qww_height = rows * itemWH;
    
    // 设置collectionVIew的滚动范围：自己计算
//    self.collectionView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.collectionView.frame));
    // 设置collectionVIew的滚动范围：让系统自己处理
    self.tableView.tableFooterView = self.collectionView;
    
    // 刷新表格
    [_collectionView reloadData];
}

#pragma mark - 处理加载数据
- (void)resolveData {
    // 需要补item的个数 为 clos - count % cols
    NSInteger count = _squares.count;
    NSInteger over = count % cols;
    if(over) {
        for (int i = 0; i < cols - over; i++) {
            QwwSquareItem *item = [[QwwSquareItem alloc] init];
            [_squares addObject:item];
        }
    }
}

#pragma mark - 设置tableView底部视图
- (void)setupFootView {
    /*
        1.创建布局
        2.一定要先注册
        3.cell必须要自定义
     */
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(itemWH, itemWH);
    flowLayout.minimumLineSpacing = margin;
    flowLayout.minimumInteritemSpacing = margin;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = self.tableView.backgroundColor;
    collectionView.dataSource = self;
    // 设置代理
    collectionView.delegate = self;
    // 禁止collectionView滚动
    collectionView.scrollEnabled = NO;
    self.tableView.tableFooterView = collectionView;
    self.collectionView = collectionView;
    // 注册cell
    [collectionView registerNib:[UINib nibWithNibName:@"QwwSquareCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 跳转界面 push 展示网页
    /*
     1.Safari openURL：自带很多功能（进度条，刷新，前进，倒退等等功能），必须要跳出当前应用
     2.UIWebView（没有功能），在当前应用打开网页，并且有safar1，自己实现，UIWebView不能实现进度条
     3.SFSafariViewController：专门用来展示网页 需求：即想要在当前应用展示网页，又想要safari功能 i0S9才能使用
        3.1导入#import <SafariServices/SafariServices.h>
     4. WKWebView i0$8（UIWebView升级版本，添加功能 1.监听进度 2.缓存）
        4.1导入#import <WebKit/WebKit.h>
    */
    // 创建网页控制器
    QwwSquareItem *item = _squares[indexPath.row];
    if(![item.url containsString:@"http"]) return;
    QwwWebViewController *webVC = [[QwwWebViewController alloc] init];
    webVC.url = [NSURL URLWithString:item.url];
    [self.navigationController pushViewController:webVC animated:YES];
    
}

- (void)safariView {
////    QwwSquareItem *item = _squares[indexPath.row];
//    if(![item.url containsString:@"http"]) return;
//    NSURL *url = [NSURL URLWithString:item.url];
//    
//    // SFSafariViewController 推荐使用modal
//    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
////    self.navigationController.navigationBarHidden = YES;
////    safariVC.delegate = self;
////    [self.navigationController pushViewController:safariVC animated:YES];
//    [self presentViewController:safariVC animated:YES completion:nil];
}

#pragma mark - SFSafariViewControllerDelegate
//- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
//    [self.navigationController popViewControllerAnimated:YES];
////    self.navigationController.navigationBarHidden = NO;
//}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _squares.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 从缓存池中取
    QwwSquareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    QwwSquareItem *item = _squares[indexPath.row];
    
    cell.item = item;
    return cell;
}

#pragma mark - 设置导航条
- (void)setuptabBar {
    // 设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] WithHighlightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] addTarget:self action:@selector(setting)];
    // 夜视
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] WithSelectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] addTarget:self action:@selector(night:)];
    
    // 左边按钮
    self.navigationItem.rightBarButtonItems = @[settingItem, nightItem];
    
    // title
    self.navigationItem.title = @"我的";
//    // 只要是通过模型设置，都是通过富文本设置
//    // 设置顶部条标签 -> UINavigationBar
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
//    [self.navigationController.navigationBar setTitleTextAttributes:attrs];
    
}

#pragma mark - 夜视模式点击
- (void)night:(UIButton *)button {
    button.selected = !button.selected;
    NSLog(@"%s",__func__);
}

#pragma mark - 设置点击（）
- (void)setting {
    // 跳转到设置界面
    QwwSettingTableViewController *settingVC = [[QwwSettingTableViewController alloc] init];
    // 必须在转跳前调用
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
    /*
         1.底部条要隐藏
         2.处理返回按钮样式  => 去设置控制器设置返回按钮 
     */
}

@end
