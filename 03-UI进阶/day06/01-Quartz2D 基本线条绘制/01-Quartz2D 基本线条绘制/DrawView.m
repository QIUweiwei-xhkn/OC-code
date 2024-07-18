//
//  DrawView.m
//  01-Quartz2D 基本线条绘制
//
//  Created by wei wei on 2024/7/9.
//

#import "DrawView.h"

@implementation DrawView


/// 作用：专门用来绘图
/// 什么时候调用：当View显示的时候调用
/// - Parameter rect: 当View的bounds
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",NSStringFromCGRect(rect)); // {{0, 0}, {300, 300}}
    
    // 1.在drawRect方法当中系统已经帮你创建一个跟View相关联的上下文，（Layer上下文）
    // 只要获取上下文就行了，
    
    // 画曲线
    // 1.获取上下文
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    // 2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 280)];
    [path addQuadCurveToPoint:CGPointMake(280, 280) controlPoint:CGPointMake(50, 50)];
    // 3.把路径添加到上下文
    CGContextAddPath(ctf, path.CGPath);
    // 4.把上下文的内容渲染View上
    CGContextStrokePath(ctf);
}

// 画直线
-(void)drawLine {
    // 1.1 获取上下文(获取，创建上下文都是以UIGraphics开头的 )
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    // 1.2 绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 1.2.1 设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    // 1.2.2 添加一根线到终点
    [path addLineToPoint:CGPointMake(280, 50)];
    
    // 画第二条线
//    [path moveToPoint:CGPointMake(50, 200)];
//    [path addLineToPoint:CGPointMake(200, 50)];
    
    // 把上一条线的终点当成起点
    [path addLineToPoint:CGPointMake(280, 280)];
    
    // 上下文状态
    // 设置线宽
    CGContextSetLineWidth(ctf, 10);
    // 设置线的连线方式
    // kCGLineJoinMiter,  // 默认
    // kCGLineJoinRound,  // 圆角
    // kCGLineJoinBevel   // 削平
    CGContextSetLineJoin(ctf, kCGLineJoinRound);
    // 设置线的顶端（不是连接端）
    // kCGLineCapButt,   // 默认
    // kCGLineCapRound,  // 圆角
    // kCGLineCapSquare  //
    CGContextSetLineCap(ctf, kCGLineCapRound);
    
    // 设置线的颜色
    [[UIColor redColor] setStroke];
     
    // 1.3 把绘制的内容保存到上下文当中。
//  UIBezierPath: UIkit框架 ->  CGPathRef: CoreGraphcis框架
    CGContextAddPath(ctf, path.CGPath);
    // 1.4 把上下文的内容显示到View上（渲染到View的layer）(stroke连线  fill填充)
    CGContextStrokePath(ctf);
}
@end
