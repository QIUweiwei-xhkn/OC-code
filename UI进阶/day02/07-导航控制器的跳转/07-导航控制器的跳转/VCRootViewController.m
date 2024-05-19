//
//  VCRootViewController.m
//  07-导航控制器的跳转
//
//  Created by wei wei on 2024/5/18.
//

#import "VCRootViewController.h"
#import "TwoViewController.h"

@interface VCRootViewController ()

@end

@implementation VCRootViewController
- (IBAction)jumpVc:(id)sender {
    TwoViewController *tvc = [[TwoViewController alloc] init];
    // navigationController 获取当前所在的导航控制器
    [self.navigationController pushViewController:tvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航条内容 由栈顶控制器决定
    // 设置标题
    self.navigationItem.title = @"根控制器";
    
    // 设置根控制器标题视图
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    // 设置左侧标题
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]  initWithTitle:@"left" style:0 target:self action:@selector(leftClick)];
    
    // 设置右侧图片
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImage *originImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:originImage style:0 target:self action:@selector(rightClick)];
    
    // 设置右侧为自定义的View
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateHighlighted];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)leftClick {
    NSLog(@"%s",__func__);
}

- (void)rightClick {
    NSLog(@"%s",__func__);
}

- (void)btnClick {
    NSLog(@"%s",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
