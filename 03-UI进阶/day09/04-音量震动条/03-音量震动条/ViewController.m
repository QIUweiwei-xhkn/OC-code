//
//  ViewController.m
//  03-音量震动条
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 复制层
    CAReplicatorLayer *replayer = [CAReplicatorLayer layer];
    replayer.frame = self.contentV.bounds;
    [self.contentV.layer addSublayer:replayer];
    
    // 创建一个震动条
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 30, 80);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.contentV.bounds.size.height);
    [replayer addSublayer:layer];
    
    // 添加动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.duration = 1;
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
    
    replayer.instanceCount = 6;
    replayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    // 设置复制出来的子层的动画延迟时长
    replayer.instanceDelay = 1;
    
}


@end
