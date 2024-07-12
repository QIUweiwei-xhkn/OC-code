//
//  ViewController.m
//  12-核心动画和UIView的区别
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *redV;

@end

@implementation ViewController
/*
 UIView与核心动画区别？（掌握）
 1.核心动画只作用在layer.
 2.核心动画看到的都是假像，它并没有去修改UIView的真实位置
 
 什么时候使用核心动画？
 1.当不需要与用户进行交互了使用核心动画
 2.当要根据路径做动画时，使用核心动画
 3.当做转场动画时，使用核心动画（转场类型比较多）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromCGRect(self.redV.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"position.x";
//    anim.toValue = @100;
//    anim.duration = 1;
//    anim.delegate = self;
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    [self.redV.layer addAnimation:anim forKey:nil];
    
    // UIView的转场动画 类型较少
    /*
     UIViewAnimationOptionTransitionNone             // default
     UIViewAnimationOptionTransitionFlipFromLeft
     UIViewAnimationOptionTransitionFlipFromRight
     UIViewAnimationOptionTransitionCurlUp
     UIViewAnimationOptionTransitionCurlDown
     UIViewAnimationOptionTransitionCrossDissolve
     UIViewAnimationOptionTransitionFlipFromTop
     UIViewAnimationOptionTransitionFlipFromBottom
     */
//    [UIView transitionWithView:self.redV duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:nil completion:nil];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.redV.center = CGPointMake(50, 400);
    } completion:^(BOOL finished) {
        NSLog(@"finish---%@",NSStringFromCGRect(self.redV.frame));
    }];

}
// 动画开始时执行
-(void)animationDidStart:(CAAnimation *)anim {
//    NSLog(@"%s",__func__);
}

// 动画完成时时执行
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    NSLog(@"%s",__func__);
    NSLog(@"finish---%@",NSStringFromCGRect(self.redV.frame));
}
@end
