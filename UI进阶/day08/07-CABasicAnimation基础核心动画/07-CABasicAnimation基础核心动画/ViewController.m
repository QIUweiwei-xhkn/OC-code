//
//  ViewController.m
//  07-CABasicAnimation基础核心动画
//
//  Created by wei wei on 2024/7/11.
//

#import "ViewController.h"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, strong) IBOutlet UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 2.设置属性值
    anim.keyPath = @"position.x";
    anim.toValue = @300;
    // 动画完成时，会自动删除动画
    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards; // 保存最后的状态
    anim.fillMode = kCAFillModeBackwards; // 去，回，最后为原始的状态
//    anim.fillMode = @"backwards";
//    self.redView.layer.position = CGPointMake(100, 100);
    [self.redView.layer addAnimation:anim forKey:nil];
}


@end
