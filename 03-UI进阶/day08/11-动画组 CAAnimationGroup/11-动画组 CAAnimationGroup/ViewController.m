//
//  ViewController.m
//  11-动画组 CAAnimationGroup
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CABasicAnimation *anim1 = [CABasicAnimation animation];
    anim1.keyPath = @"position.x";
    anim1.toValue = @100;
//    anim1.removedOnCompletion = NO;
//    anim1.fillMode = kCAFillModeForwards;
//    [self.redV.layer addAnimation:anim1 forKey:nil];
    
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"position.y";
    anim2.toValue = @100;
//    anim2.removedOnCompletion = NO;
//    anim2.fillMode = kCAFillModeForwards;
//    [self.redV.layer addAnimation:anim2 forKey:nil];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[anim1, anim2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [self.redV.layer addAnimation:group forKey:nil];
}


@end
