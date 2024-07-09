//
//  pieView.m
//  04-饼图
//
//  Created by wei wei on 2024/7/9.
//

#import "pieView.h"

@implementation pieView

- (void)drawRect:(CGRect)rect {
    NSArray *dataArray = @[@25 , @25, @50];
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat r = self.bounds. size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for(NSNumber *number in dataArray) {
        startA = endA;
        angle = number.intValue/100.0 * M_PI *2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }
}


// 生成一个随机颜色
- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 重绘
    [self setNeedsDisplay];
}
-(void)drawPie {
    // 画第一个扇形
//    CGContextRef ctf = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat r = self.bounds. size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 25/100.0 * M_PI *2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path addLineToPoint:center];
    [[UIColor redColor] set];
    [path fill];
//    [path closePath];
//    CGContextAddPath(ctf, path.CGPath);
//    CGContextFillPath(ctf);
    
    // 画第二个饼图
    startA = endA;
    angle = 25/100.0 * M_PI *2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor greenColor] set];
    [path fill];
    
    // 画第三个饼图
    startA = endA;
    angle = 50/100.0 * M_PI *2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor blueColor] set];
    [path fill];
}
@end
