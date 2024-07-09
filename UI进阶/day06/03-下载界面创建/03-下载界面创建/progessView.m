//
//  progessView.m
//  03-下载界面创建
//
//  Created by wei wei on 2024/7/9.
//

#import "progessView.h"

@implementation progessView
- (void)setProgessValue:(CGFloat)progessValue {
    _progessValue = progessValue;
    // 注意：drawRect如果是手动调用的话，它是不会给你创建跟View相关联的上下文.
    // 只有系统调用该方法时，才会创建跟View相关联的上下文，
//    [self drawRect:self.bounds];
    
    // 重绘（系统自动帮你调用drawRect：）
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat r = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat angle = self.progessValue * M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startA endAngle:endA clockwise:YES];
    CGContextAddPath(ctf, path.CGPath);
    CGContextStrokePath(ctf);
}


@end
