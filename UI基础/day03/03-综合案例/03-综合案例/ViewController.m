//
//  ViewController.m
//  03-综合案例
//
//  Created by wei wei on 2024/1/29.
//

#import "ViewController.h"

@interface ViewController ()
// 购物车
@property (weak, nonatomic) IBOutlet UIImageView *shopCarVIew;
// 添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;
// 删除按钮
@property (strong, nonatomic) IBOutlet UIButton *removeButton;

// 全局的下标
// @property(nonatomic, assign) NSInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 给下标赋值
    // self.index = 0;
}
// 添加到购物车
- (IBAction)add:(UIButton *)button {
    /*****************************定义一些变量*************************************/
    // 1.总列数
    NSInteger allCols = 3;
    // 2.商品的宽度 和 高度
    CGFloat width = 80;
    CGFloat heigth = 100;
    // 3.水平间距 和 垂直间距
    CGFloat hMargin = (self.shopCarVIew.frame.size.width - allCols * width) / (allCols - 1);
    CGFloat vMargin = (self.shopCarVIew.frame.size.height - heigth * 2);
    // 4. 设置索引
    NSInteger index = self.shopCarVIew.subviews.count;
    // 4.求出X值
    CGFloat x = (hMargin + width) * (index % allCols);
    // 5.求出Y值
    CGFloat y = (vMargin + heigth) * (index / allCols);
    /*********************创建一个商品*************************/
    // 创建商品的View
    UIView *shopView = [[UIView alloc] init];
    // 设置frame
    shopView.frame = CGRectMake(x, y, width, heigth);
    // 设置背景颜色
    shopView.backgroundColor = [UIColor greenColor];
    // 添加到购物车
    [self.shopCarVIew addSubview:shopView];
    
    /*****************设置按钮状态***********************/
//    if(index == 5) {
//        self.addButton.enabled = NO;
//    }
    button.enabled = (index != 5);
    
    // 设置删除按钮状态
    self.removeButton.enabled = YES;
    
    // 下标加一
//    self.index++;
}

// 从购物车中删除
- (IBAction)remove:(UIButton *)button {
    // 1.删除最后一个商品
    UIView *lastShopView = [self.shopCarVIew.subviews lastObject];
    [lastShopView removeFromSuperview];
    
    // 2. 下标减一
//    self.index--;
    
    // 3.设置添加按钮状态
    self.addButton.enabled = YES;
    
    // 设置删除按钮状态
//    if(self.shopCarVIew.subviews.count == 0) {
//        self.removeButton.enabled = NO;
//    }
    self.removeButton.enabled = (self.shopCarVIew.subviews.count != 0);
}

@end
