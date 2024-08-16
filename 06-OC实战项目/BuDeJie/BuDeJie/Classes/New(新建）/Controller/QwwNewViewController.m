//
//  QwwNewViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/8.
//

#import "QwwNewViewController.h"
#import "QwwSubTagViewController.h"

@interface QwwNewViewController ()

@end

@implementation QwwNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setuptabBar];
}

#pragma mark - 设置导航条
- (void)setuptabBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] WithHighlightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] addTarget:self action:@selector(tagClick)];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}

#pragma mark - 点击订阅标签调用
- (void)tagClick {
    // 转跳推荐界面
    QwwSubTagViewController *subTagVC = [[QwwSubTagViewController alloc] init];
    [self.navigationController pushViewController:subTagVC animated:YES];
}
@end
