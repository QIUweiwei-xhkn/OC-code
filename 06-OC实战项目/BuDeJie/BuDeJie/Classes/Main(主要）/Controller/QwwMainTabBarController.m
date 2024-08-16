//
//  QwwMainTabBarController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/9.
//

#import "QwwMainTabBarController.h"
#import "QwwEssenceViewController.h"
#import "QwwFriendTrendsViewController.h"
#import "QwwMeViewController.h"
#import "QwwNewViewController.h"
#import "QwwPublishViewController.h"
#import "UIImage+image.h"
#import "QwwTabBar.h"
#import "QwwNavigationController.h"

@interface QwwMainTabBarController ()

@end

@implementation QwwMainTabBarController

/*
     问题：
     1.选中的图片被渲染 -》 IOS7之后 默认tabBar上按纽图片都会被渲染 1.修这图片 2.通过代码 ✅
     2.选中标题颜色：黑色 标题字体大 --》 对应子控制器的tabBarItem
     3.发布按钮显示不出来，位置也不对，分析：
         1)有没有文字，图片的位置都固定
         2)加号的图片比其他图片大因此就会超出tabBar
         3)不想要超出，让加号的图片垂直居中 =>修改加号按钮位置 => tabBar上按钰位置由系统决定，我们自己不能决定=>系统的tabBarButton没有提供高亮图片状态，因此做不了实例才序效果=> 加号，应该是普通按钮，高亮状态 =>发布控制器不是tabBarContoller子控制器
         4)最终方案：调整系统TaBBar上按钮位置，平均分成5等分，在把加号按钮显示在中间就好了
         // 调整系统自带控件的子控件的位置 => 自定义tabBar => 使用tabBar
        // 研究下，系统的tabBarButton什么时候添加到self.tabBar，在viewWillAppear
 */


// 只会调用一次
+  (void)load {
    /*
         appearance:
         1.只要遵守了UIAppearance协议，还要实现这个方法
         2.哪些属性可以通过appearance设置，只有被UI_APPEARANCE_SELECTOR宏修饰的属性，才能设置
     */
    // 获取整个应用程序下的UITabBarItem
//    UITabBarItem *item = [UITabBarItem appearance];
    
    // 获取在哪个类中的UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    // 设置按钮选中标题的颜色
    
    // 设置按纽选中标题的颜色：富事本：描述一个文字颜色，字体，阴影，空心，图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    // 设置字体尺寸：只有设置正常状态下，才会有效果
    NSMutableDictionary *attrNor = [NSMutableDictionary dictionary];
    attrNor[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [item setTitleTextAttributes:attrNor forState:UIControlStateNormal];
    
//    item.title = @"123";
    
}

// 注意：可能会调用多次
//+ (void)initialize {
//    if(self == [QwwMainTabBarController class]) {
//
//    }
//}
#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1 添加子控制器（5个子控制器）
    [self setupAllChildControllers];
    
    // 2 设置tabBar上按钮内容 -》 有对应的子控制器的tabBarItem属性
    [self setupAllTabBarItem];
//    NSLog(@"%@", self.tabBar.subviews);
    
    // 3 设置TabBar
    [self setupTabBar];
//    NSLog(@"%@", self.tabBar.subviews);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    NSLog(@"%@", self.tabBar.subviews);
}

#pragma mark - 设置tabBar
- (void)setupTabBar {
    QwwTabBar *tabBar = [[QwwTabBar alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    // kvc
    [self setValue:tabBar forKey:@"tabBar"];
//    self.tabBar = tabBar;
}

#pragma mark - 添加所有子控制器
- (void)setupAllChildControllers {
    // 精华
    QwwEssenceViewController *essenceVC = [[QwwEssenceViewController alloc] init];
    // tabbar：会把第0个子控制器的view添加上去
    QwwNavigationController *essNav = [[QwwNavigationController alloc] initWithRootViewController:essenceVC];
    // initWithRootViewController:push
    essNav.navigationBar.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:essNav];
    
    // 新建
    QwwNewViewController *newVC = [[QwwNewViewController alloc] init];
    QwwNavigationController *newNav = [[QwwNavigationController alloc] initWithRootViewController:newVC];
    newNav.navigationBar.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:newNav];
    
    // 发布
//    QwwPublishViewController *publishVC = [[QwwPublishViewController alloc] init];
//    [self addChildViewController:publishVC];
    
    // 关注
    QwwFriendTrendsViewController *ftVC = [[QwwFriendTrendsViewController alloc] init];
    QwwNavigationController *ftNav = [[QwwNavigationController alloc] initWithRootViewController:ftVC];
    ftNav.navigationBar.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:ftNav];
    
    // 我
    UIStoryboard *minestoryboard = [UIStoryboard storyboardWithName:NSStringFromClass([QwwMeViewController class]) bundle:nil];
    // 加载箭头指向的控制器
    QwwMeViewController *meVC = [minestoryboard instantiateInitialViewController];
    QwwNavigationController *meNav = [[QwwNavigationController alloc] initWithRootViewController:meVC];
    [self addChildViewController:meNav];
}

#pragma mark - 设置tabBar上所有按钮的内容
- (void)setupAllTabBarItem {
    // essNav
    QwwNavigationController *essNav = self.childViewControllers[0];
    essNav.tabBarItem.title = @"精华";
    // 快速生成一个没有渲染的图片
    essNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essNav.tabBarItem.selectedImage = [UIImage imageRenderOriginalWithImageName:@"tabBar_essence_click_icon"];
    
    
    // newNav
    QwwNavigationController *newNav = self.childViewControllers[1];
    newNav.tabBarItem.title = @"新帖";
    newNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newNav.tabBarItem.selectedImage = [UIImage imageRenderOriginalWithImageName:@"tabBar_new_click_icon"];
    
//    // publish
//    UIViewController *publishVC = self.childViewControllers[2];
//    publishVC.tabBarItem.image = [UIImage imageRenderOriginalWithImageName:@"tabBar_publish_icon"];
//    publishVC.tabBarItem.selectedImage = [UIImage imageRenderOriginalWithImageName:@"tabBar_publish_click_icon"];
//    // 设置图片位置
//    publishVC.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    // ftNav
    QwwNavigationController *ftNav = self.childViewControllers[2];
    ftNav.tabBarItem.title = @"关注";
    ftNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    ftNav.tabBarItem.selectedImage = [UIImage imageRenderOriginalWithImageName:@"tabBar_friendTrends_click_icon"];
    
    // meNav
    QwwNavigationController *meNav = self.childViewControllers[3];
    meNav.tabBarItem.title = @"我";
    meNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    meNav.tabBarItem.selectedImage = [UIImage imageRenderOriginalWithImageName:@"tabBar_me_click_icon"];
}

@end
