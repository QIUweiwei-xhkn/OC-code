//
//  BageButton.m
//  07-QQ粘性布局
//
//  Created by wei wei on 2024/7/13.
//

#import "BageButton.h"
@interface BageButton ()
/** 当前的小圆   */
@property(nonatomic, weak) UIView *smallCir;
/** <#注释#>   */
@property(nonatomic, weak) CAShapeLayer *shapeLayer;
@end

@implementation BageButton
- (CAShapeLayer *)shapeLayer {
    if(_shapeLayer == nil)  {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [self.superview.layer insertSublayer:shapeLayer atIndex:0];
        shapeLayer.fillColor = [UIColor redColor].CGColor;
        _shapeLayer = shapeLayer;
    }
    return _shapeLayer ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint transP = [pan translationInView:self];
    // 注意：transform 修改的是frame 不会修改center
//    self.transform = CGAffineTransformTranslate(self.transform, transP.x, transP.y);
    CGPoint center = self.center;
    center.x += transP.x;
    center.y += transP.y;
    self.center = center;
    
    [pan setTranslation:CGPointZero inView:self];
    CGFloat distance = [self distanceWithSmallCir:self.smallCir BigCir:self];
//    NSLog(@"%f", distance);
    
    // 让小圆半径随着距离的增大而减小
    CGFloat smallCirR = self.bounds.size.width * 0.5;
    smallCirR -= distance / 10.0;
    self.smallCir.bounds = CGRectMake(0, 0, smallCirR * 2, smallCirR * 2);
    self.smallCir.layer.cornerRadius = smallCirR;
    
    UIBezierPath *path = [self pathWithSmallCir:self.smallCir bigCir:self];
    // 形状图层
    if(self.smallCir.hidden == NO) {
        self.shapeLayer.path = path.CGPath;
    }
    
    if(distance > 60) {
        // 让小圆隐藏，让路径隐藏
        self.smallCir.hidden = YES;
        [self.shapeLayer  removeFromSuperlayer];
    }
    
    if(pan.state == UIGestureRecognizerStateEnded) {
        // 判断距离是否大于60
        // 大于60让按钮消失
        if(distance < 60) {
            // 小于60让按钮复位
            [self.shapeLayer removeFromSuperlayer];
            self.center = self.smallCir.center;
            self.smallCir.hidden = NO;
        }else {
            // 播放一个动画消失
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
            NSMutableArray *imageArray = [NSMutableArray array];
            for(int i = 0; i < 5; i++) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i +  1]];
                [imageArray addObject:image];
            }
            imageV.animationImages = imageArray;
            imageV.animationDuration = 1;
            [imageV startAnimating];
            [self addSubview:imageV];
            
            // 延迟一秒
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
        }
    }
}

// 求两个圆之间的不规则路径
- (UIBezierPath *)pathWithSmallCir:(UIView *)smallCir bigCir:(UIView *)bigCir {
    CGFloat x1 = smallCir.center.x;
    CGFloat y1 = smallCir.center.y;
    CGFloat x2 = bigCir.center.x;
    CGFloat y2 = bigCir.center.y;
    CGFloat d = [self distanceWithSmallCir:smallCir BigCir:bigCir];
    if (d <= 0) {
    return nil;
    }
    CGFloat cos  = (y2 - y1) / d;
    CGFloat sin = (x2 - x1) / d;
    CGFloat r1 = smallCir.bounds.size.width * 0.5;
    CGFloat r2 = bigCir.bounds.size.width * 0.5;
    
    // 描述点
    CGPoint pointA = CGPointMake(x1 - r1 * cos, y1 + r1 * sin);
    CGPoint pointB = CGPointMake(x1 + r1 * cos, y1 - r1 * sin);
    CGPoint pointC = CGPointMake(x2 + r2 * cos, y2 - r2 * sin);
    CGPoint pointD = CGPointMake(x2 - r2 * cos, y2 + r2 * sin);
    CGPoint pointO = CGPointMake(pointA.x + d * 0.5 * sin, pointA.y + d * 0.5 * cos);
    CGPoint pointP = CGPointMake(pointB.x + d * 0.5 * sin, pointB.y + d * 0.5 * cos);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    // AB
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];
    // BC(曲线)
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    // CD
    [path addLineToPoint:pointD];
    // DA (曲线)
    [path addQuadCurveToPoint:pointA controlPoint:pointO];
    
    return path;
}

// 求两个圆之间的距离
- (CGFloat)distanceWithSmallCir:(UIView *)smallCir BigCir:(UIView *)bigCir {
    // x的偏移量
    CGFloat offsetX = bigCir.center.x - smallCir.center.x;
    // y的偏移量
    CGFloat offsetY = bigCir.center.y - smallCir.center.y;
    return sqrt(offsetX * offsetX + offsetY * offsetY);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    [self setBackgroundColor:[UIColor redColor]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    // 添加小圆
    UIView *smallCir = [[UIView alloc] initWithFrame:self.frame];
    smallCir.backgroundColor = self.backgroundColor;
    smallCir.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.smallCir = smallCir;
    // 把小圆添加到指定的位置
    [self.superview insertSubview:smallCir belowSubview:self];
}

// 取消高亮状态
- (void)setHighlighted:(BOOL)highlighted {
}
@end
