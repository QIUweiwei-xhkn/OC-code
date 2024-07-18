//
//  QArenaViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "QArenaViewController.h"

@interface QArenaViewController ()

@end

@implementation QArenaViewController
// 第一次加载View的时候调用
// 如果自定义View，重写该方法
- (void)loadView {
    // 不能在这个方法中调用self.view.bounds ，调用会造成死循环
    UIImageView *imageView = [[UIImageView alloc]  initWithFrame:[UIScreen mainScreen].bounds];
    
//    [self.view addSubview:imageView];
    self.view = imageView; 
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    // 允许用户交互
    imageView.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置titleView
    UISegmentedControl *segMentControl = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];
    segMentControl.backgroundColor = [UIColor greenColor];
    // 2.设置不同状态下的背景图片
    [segMentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segMentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    // 3.设置字体颜色和大小
    [segMentControl setTitleTextAttributes:@{
        NSForegroundColorAttributeName: [UIColor whiteColor]
    }  forState:UIControlStateNormal];
    // 4.设置选中的索引
    segMentControl.selectedSegmentIndex = 0;
    
    // 5.设置前景色
    segMentControl.selectedSegmentTintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1];
    
    self.navigationItem.titleView = segMentControl;
}

@end
