//
//  QTabBarViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "QTabBarViewController.h"
#import "QHallTableViewController.h"
#import "QArenaViewController.h"
#import "QHistroyTableViewController.h"
#import "QMyLotteryViewController.h"
#import "QDiscoverTableViewController.h"
#import "QNavigatonViewController.h"
#import "QArenaNavViewController.h"
#import "QTabBar.h"

@interface QTabBarViewController ()<QtabBarDelegate>
/** <#注释#>   */
@property(nonatomic, strong) NSMutableArray *items;
@end

@implementation QTabBarViewController
- (NSMutableArray *)items {
    if(!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setUpAllChildViewControl];
//    self.selectedIndex = 2;
    
    // 2.自定义的tabBar
    [self setupTabBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 移除系统tabar子控件 UITabBarButton
    // UITabBarButton是私有属性
    for (UIView *view in self.tabBar.subviews) {
//        [view removeFromSuperview];
//        NSLog(@"%@", view);
        // 逆向思维判断一下当前点控件是不是XMGTabBar，如果不是直接移除
        if(![view isKindOfClass:[QTabBar class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)setupTabBar {
    /*
    1. tabBar UIView
    2. UIButton
    3. 切换自控制 selectedIndex
    */
    // 1.移除系统的tabBar
//    [self.tabBar removeFromSuperview];
    // 2.添加自己的tabBar
    QTabBar *tabBar = [[QTabBar alloc] init];
    // 只传子控件的个数不能符合需求，不能在设置自定义的tabBarItem时设置图片，应该直接传模型(可以获得数量和模型封装的属性  )
//    tabBar.count = self.childViewControllers.count;
    tabBar.items  = self.items;
    
    [self.tabBar addSubview:tabBar];
    
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor redColor];
    tabBar.delegate = self;
//    NSLog(@"%@", NSStringFromCGRect(self.tabBar.frame));
//    NSLog(@"%@", self.items);
}



-(void)tabBar:(QTabBar *)tabBar WithIndex:(NSInteger)index {
    self.selectedIndex = index;
}

// 添加所有的子控制器
- (void)setUpAllChildViewControl {
    // 自定义
    // 1.移除（简单粗暴）
    /*
    1. tabBar UIView
    2. UIButton
    3. 切换自控制 selectedIndex
    */
 
    // 2.移除tabBar子控件
    
    
    // 1.购彩大厅
    QHallTableViewController *hallVC = [[QHallTableViewController alloc] init];
    hallVC.view.backgroundColor = [UIColor yellowColor];
    [self setUpOneChildViewController:hallVC image:[UIImage imageNamed:@"TabBar_Hall_new"] selImage:[UIImage imageNamed:@"TabBar_Hall_Selected_new"] WithTitle:@"购彩大厅"];
//    [self.items addObject:hallVC.tabBarItem];
    // 2.竞技场
    QArenaViewController *arenaVC = [[QArenaViewController alloc] init];
    arenaVC.view.backgroundColor = [UIColor blueColor];
//    [self addChildViewController:arenaVC];
    [self setUpOneChildViewController:arenaVC image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_Selected_new" ] WithTitle:nil];
    // 3.发现
    // 3.1加载storyBoard
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"QDiscoverTableViewController" bundle:nil];
    // 3.2 初始化箭头指向的控制器
    QDiscoverTableViewController *discoverVC   =  [storyBoard instantiateInitialViewController];
    
//    QDiscoverTableViewController *discoverVC = [[QDiscoverTableViewController alloc] init];
//    discoverVC.view.backgroundColor = [UIColor greenColor]; 
//    [self addChildViewController:discoverVC];
    [self setUpOneChildViewController:discoverVC image:[UIImage imageNamed:@"TabBar_Discover_new"] selImage:[UIImage imageNamed:@"TabBar_Discover_Selected_new"] WithTitle:@"发现"];
    // 4.开奖信息
    QHistroyTableViewController *historyVC = [[QHistroyTableViewController alloc] init];
    historyVC.view.backgroundColor = [UIColor whiteColor];
//    [self addChildViewController:historyVC];
    [self setUpOneChildViewController:historyVC image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_Selected_new"] WithTitle:@"开奖信息"];
    // 5.我的彩票
    QMyLotteryViewController *myLotteryVC = [[QMyLotteryViewController alloc] init];
//    myLotteryVC.view.backgroundColor = [UIColor grayColor];
//    [self addChildViewController:myLotteryVC];
    [self setUpOneChildViewController:myLotteryVC image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_new"] WithTitle:@"我的彩票"];
}

// 添加一个控制器
- (void)setUpOneChildViewController:(UIViewController *)childController image:(UIImage *)image selImage:(UIImage *)selImage WithTitle:(NSString *)title{
    //包装成一个导航控制器
    // 1.创建导航控制器
    UINavigationController *nav = [[QNavigatonViewController alloc] initWithRootViewController:childController];
    if([childController isKindOfClass:[QArenaViewController class]]) {
        nav = [[QArenaNavViewController alloc] initWithRootViewController:childController];
    }
    
    childController.title = title;
    
    [self addChildViewController:nav];
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = selImage;
    [self.items addObject:childController.tabBarItem];
    
//    NSLog(@"%@", childController.tabBarItem);
//    NSLog(@"%@", self.items);
//    NSLog(@"%@", childController);
}
@end
