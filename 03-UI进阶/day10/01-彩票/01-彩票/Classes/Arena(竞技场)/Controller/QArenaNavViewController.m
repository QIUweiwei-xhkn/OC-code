//
//  QArenaNavViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import "QArenaNavViewController.h"

@interface QArenaNavViewController ()

@end

@implementation QArenaNavViewController
+ (void)initialize {
    // 1.获得导航条标识
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    // 2.设置导航条背景图片
    // 创建 UINavigationBarAppearance 对象
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundImage = [UIImage imageNamed:@"NLArenaNavBar64"];
    [appearance setShadowImage:[[UIImage alloc] init]];
    bar.standardAppearance = appearance;
    bar.scrollEdgeAppearance = appearance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
