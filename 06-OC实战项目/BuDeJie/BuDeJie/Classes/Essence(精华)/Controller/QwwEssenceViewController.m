//
//  QwwEssenceViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/8.
//

#import "QwwEssenceViewController.h"
#import "UIBarButtonItem+Item.h"

@interface QwwEssenceViewController ()

@end
// UIBarButtonItem：描述按钮具体的内容
// UINavigationItem：设置导航条上内容（左边，右边，中间）
// tabBarItem：设置tabBar上按钮内容（tabBarButton）
@implementation QwwEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // 设置导航条
    [self setuptabBar];
    // 添加scrollView
    [self setupScrollView];
    // 添加标题栏
    [self setupTitleBar];
}

#pragma mark - 添加scrollView
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}

#pragma mark - 设置标题栏
- (void)setupTitleBar {
    UIView *titleView = [[UIView alloc] init];
    // 设置半透明的背景图片
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
//    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//    titleView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    // 子控件会继承父控件的设置的aplha透明度
//    titleView.alpha = 0.5 ;
    titleView.frame = CGRectMake(0, 97, self.view.frame.size.width, 35);
    [self.view addSubview:titleView];
}

#pragma mark - 设置导航条
- (void)setuptabBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_iconN"] WithHighlightedImage:[UIImage imageNamed:@"nav_item_game_click_iconN"] addTarget:self action:@selector(game)];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandomN"] WithHighlightedImage:[UIImage imageNamed:@"navigationButtonRandomClickN"] addTarget:nil action:nil];
}

#pragma mark - 左边按钮方法点击调用的方法
- (void)game {
    NSLog(@"%s",__func__);
}


@end
