//
//  QTestViewController.m
//  03-综合案例
//
//  Created by wei wei on 2024/1/31.
//

#import "QTestViewController.h"
#import "QShopView.h"

@interface QTestViewController ()

@end

@implementation QTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建商品的View
    UIView *shopView = [[UIView alloc] init];
    // 设置frame
    shopView.frame = CGRectMake(0, 0, 80, 100);
    // 设置背景颜色
    shopView.backgroundColor = [UIColor greenColor];
    // 添加到购物车
    [self.view addSubview:shopView];
    
    // 创建商品UIImageView对象
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(0, 0, 80, 80);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    
    // 创建商品标题对象
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.frame = CGRectMake(0, 80, 80, 20);
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor redColor];
    [shopView addSubview:titleLable];
}


@end
