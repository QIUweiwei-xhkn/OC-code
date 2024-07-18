//
//  DrawView.m
//  02-Quartz2D 基本图形绘制
//
//  Created by wei wei on 2024/7/9.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
//     Drawing code
    // 画椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
//    // 使用 UIBezierPath 提供的绘图方法进行绘制
//    [[UIColor redColor] set];
//    [path fill];
    
    // 画弧
    // ArcCenter:<#(CGPoint)#>： 弧所在的圆心
    // radius:<#(CGFloat)#>： 圆的半径
    // startAngle:<#(CGFloat)#>：开始角度
    // endAngle:<#(CGFloat)#>： 截止角度
    // clockwise:<#(BOOL)#>： YES：顺时针 NO：逆时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5)  radius:rect.size.width * 0.5 - 10 startAngle:0  endAngle:M_PI_2  clockwise:YES];
    
    // 画扇形
    // 添加一根线到圆心
    [path addLineToPoint:CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5)];
    // 关闭路径closePath:从路径终点连一根线到路径起点
    [path closePath];
    
    [[UIColor blueColor] set];
    // 填充之前会自动关闭路径
    [path fill];
}

- (void)drawRect {
    // 获取上下文
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    // 设置路径
    // 绘制矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 200)];
    // 圆角矩形（当矩形是正方形时，如果cornerRadius等于宽/高的一半，为圆形）
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200) cornerRadius:100];
    [[UIColor redColor] set];
    // 把路径添加进上下文
    CGContextAddPath(ctf, path.CGPath);
    // 把上下文的内容显示在view上
//    CGContextStrokePath(ctf);
    CGContextFillPath(ctf);
}
@end
