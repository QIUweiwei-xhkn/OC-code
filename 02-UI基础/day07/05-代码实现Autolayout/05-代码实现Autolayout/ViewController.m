//
//  ViewController.m
//  05-代码实现Autolayout
//
//  Created by wei wei on 2024/2/17.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.红色的View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    // 禁止 Autoresizing 自动转换成约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 2.蓝色的View
    UIView *buleView = [[UIView alloc] init];
    buleView.backgroundColor = [UIColor blueColor];
    // 禁止 Autoresizing 自动转换成约束
    buleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:buleView];
    
    /*********添加约束*******/
    // 3.添加蓝色的VIew的约束
    // 3.1 添加左边的约束
    NSLayoutConstraint *leftlcs_b = [NSLayoutConstraint constraintWithItem:buleView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [self.view addConstraint:leftlcs_b];
    
    // 3.2 添加底部边的约束
    NSLayoutConstraint *buttomlcs_b = [NSLayoutConstraint constraintWithItem:buleView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30];
    [self.view addConstraint:buttomlcs_b];
    
    // 3.3 添加右边的约束
    NSLayoutConstraint *rightlcs_b = [NSLayoutConstraint constraintWithItem:buleView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_b];
  
    // 3.4 添加宽度和高度约束
    NSLayoutConstraint *wlcs_b = [NSLayoutConstraint constraintWithItem:buleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:wlcs_b];
    
    NSLayoutConstraint *hlcs_b = [NSLayoutConstraint constraintWithItem:buleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
    [buleView addConstraint:hlcs_b];
    
    // 4.添加红色的VIew的约束
    // 4.1 添加右边的约束
    NSLayoutConstraint *rightlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_r];
    
    // 4.2 添加顶部对齐
    NSLayoutConstraint *toplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:buleView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:toplcs_r];
    
    // 4.3 添加底部对齐
    NSLayoutConstraint *buttomlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:buleView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:buttomlcs_r];
    
}

//-(void) test {
//    // 1.红色的View
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    // 禁止 Autoresizing 自动转换成约束
//    redView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:redView];
//    
//    // 2.添加约束
//    
//    // 2.1 宽度约束
//    /*
//     NSLayoutAttributeLeft = 1,
//     NSLayoutAttributeRight,
//     NSLayoutAttributeTop,
//     NSLayoutAttributeBottom,
//     NSLayoutAttributeLeading,
//     NSLayoutAttributeTrailing,
//     NSLayoutAttributeWidth,
//     NSLayoutAttributeHeight,
//     NSLayoutAttributeCenterX,
//     NSLayoutAttributeCenterY,
//     NSLayoutAttributeLastBaseline,
//     
//     NSLayoutAttributeNotAnAttribute = 0
//     
//     NSLayoutRelationLessThanOrEqual = -1,
//     NSLayoutRelationEqual = 0,
//     NSLayoutRelationGreaterThanOrEqual = 1,
//     */
//    NSLayoutConstraint *wlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
//    [redView addConstraint:wlcs];
//    
//    // 2.2 高度约束
//    NSLayoutConstraint *hlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
//    [redView addConstraint:hlcs];
//    
//    // 2.3 右边约束
//    NSLayoutConstraint *rlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
//    [self.view addConstraint:rlcs];
//    
//    // 2.4 底部约束
//    NSLayoutConstraint *buttomlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
//    [self.view addConstraint:buttomlcs];
//}

@end
