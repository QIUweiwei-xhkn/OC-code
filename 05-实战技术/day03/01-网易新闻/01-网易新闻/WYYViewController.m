//
//  WYYViewController.m
//  01-网易新闻
//
//  Created by wei wei on 2024/8/5.
//

#import "WYYViewController.h"
#import "topLineViewController.h"
#import "SocietyViewController.h"
#import "VedioViewController.h"
#import "ReaderViewController.h"
#import "HotViewController.h"
#import "ScienceViewController.h"

@interface WYYViewController ()

@end

@implementation WYYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 3.添加所有子控制器
    [self setupAllChildControlller];
}

#pragma mark - 添加所有子控制器
- (void)setupAllChildControlller{
    // 头条
    topLineViewController *vc1 = [[topLineViewController alloc] init];
    vc1.title = @"头条";
    [self addChildViewController:vc1];
    // 热点
    HotViewController *vc2 = [[HotViewController alloc] init];
    vc2.title = @"热点";
    [self addChildViewController:vc2];
    // 视频
    VedioViewController *vc3 = [[VedioViewController alloc] init];
    vc3.title = @"视频";
    [self addChildViewController:vc3];
    // 订阅
    ReaderViewController *vc4 = [[ReaderViewController alloc] init];
    vc4.title = @"订阅";
    [self addChildViewController:vc4];
    // 社会
    SocietyViewController *vc5 = [[SocietyViewController alloc] init];
    vc5.title = @"社会";
    [self addChildViewController:vc5];
    // 科技
    ScienceViewController *vc6 = [[ScienceViewController alloc] init];
    vc6.title = @"科技";
    [self addChildViewController:vc6];
}
@end
