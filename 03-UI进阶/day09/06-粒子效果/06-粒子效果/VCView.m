//
//  VCView.m
//  06-粒子效果
//
//  Created by wei wei on 2024/7/12.
//

#import "VCView.h"
@interface  VCView ()
/** <#注释#>   */
@property(nonatomic, strong) UIBezierPath *path;
/** <#注释#>   */
@property(nonatomic, weak) CALayer *dotLayer;

@end


@implementation VCView
+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 添加粒子
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(-20, 0, 20, 20);
    dotLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:dotLayer];
    self.dotLayer = dotLayer;
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 10;
    repL.instanceDelay = 0.5 ;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获得当前点
    CGPoint curP = [pan locationInView:self];
    if(pan.state == UIGestureRecognizerStateBegan) {
        [self. path moveToPoint:curP];
    }else if(pan.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:curP];
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

// 开始动画
-(void)start {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path =  self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 5;
    [self.dotLayer addAnimation:anim forKey:nil];
    
    
}
// 重绘
-(void)reDraw {
    // 删除动画
    [self.dotLayer removeAllAnimations];
    // 删除路径
    [self.path removeAllPoints];
    // 重绘
    [self setNeedsDisplay];
}
@end
