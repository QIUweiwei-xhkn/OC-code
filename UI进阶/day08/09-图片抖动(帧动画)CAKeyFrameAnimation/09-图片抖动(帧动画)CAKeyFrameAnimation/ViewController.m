//
//  ViewController.m
//  09-图片抖动(帧动画)CAKeyFrameAnimation
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"
#define angleTorad(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
// 图片沿路径运动
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(250, 100)];
    [path addLineToPoint:CGPointMake(250, 300)];
    anim.keyPath = @"position";
    anim.path = path.CGPath;
    anim.duration = 3;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.imageV.layer addAnimation:anim forKey:nil];
}

// 图标抖动
-(void)icon {
    // 创建帧动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    // 设置属性值
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(angleTorad(-5)),@(angleTorad(5)), @(angleTorad(-5))];
    
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.5;
//    anim.autoreverses = YES;
    [self.imageV.layer addAnimation:anim forKey:nil];
}
@end
