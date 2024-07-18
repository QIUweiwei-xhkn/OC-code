//
//  ViewController.m
//  05-隐式动画.
//
//  Created by wei wei on 2024/7/11.
//

#import "ViewController.h"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, weak) CALayer *layer;
@property (weak, nonatomic) IBOutlet UIView *greenV;
@end

@implementation ViewController
//- (CALayer *)layer {
//    if(_layer == nil) {
//        _
//    }
//    return _layer;
//}

/*
 • 每一个UIView内部都默认关联着一个CALayer，我们可用称这个Layer为Root Layer（根层）
 • 所有的非Root Layer，也就是手动创建的CALayer对象，都存在着隐式动画
 
 • 什么是隐式动画？
 > 当对非Root Layer的部分属性进行修改时，默认会自动产生一些动画效果
 > 而这些属性称为Animatable Properties（可动画属性）
 • 列举几个常见的Animatable Properties ：
 > bounds：用于设置CALayer的宽度和高度。修改这个属性会产生缩放动画
 > backgroundColor：用于设置CALayer的背景色。修改这个属性会产生背景色的渐变动画
 > position：用于设置CALayer的位置。修改这个属性会产生平移动画
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
       layer.frame = CGRectMake(50, 50, 100, 100);
    self.layer = layer;
    [self.view.layer addSublayer:self.layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 只有非根层才有隐式动画（自己创建的图片）
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:2];
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    [CATransaction commit];
    self.layer.bounds = CGRectMake(0, 0, 150, 150);
    self.layer.position = CGPointMake(100, 400);
    
    
    self.greenV.layer.backgroundColor = [UIColor redColor].CGColor;
    self.greenV.layer.bounds = CGRectMake(0, 0, 150, 150);
    self.greenV.layer.position = CGPointMake(300, 400);
}
@end
