//
//  ViewController.m
//  08-心跳效果
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *heartV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 设置动画属性
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    
    // 设置动画间隔
    anim.duration = 0.5;
    
    // 设置动画的重复次数
    anim.repeatCount = MAXFLOAT;
    
    // 自动翻转（怎么去，怎么回）
    anim.autoreverses = YES;
    
    // 添加动画
    [self.heartV.layer addAnimation:anim forKey:nil];
}


@end
