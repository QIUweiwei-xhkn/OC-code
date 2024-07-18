//
//  DrawView.m
//  07-图形上下文栈
//
//  Created by wei wei on 2024/7/9.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    // 获得当前的上下文
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20,150)];
    [path addLineToPoint:CGPointMake(280, 150)];
    // 将路径添加进当前的上下文中
    CGContextAddPath(ctf, path.CGPath);
    
    // 保存上下文的状态
    CGContextSaveGState(ctf);
    
    // 设置上下文的状态
    CGContextSetLineWidth(ctf, 10);
    [[UIColor redColor] set];
    
    // 将上下文中的内容显示在View上
    CGContextStrokePath(ctf);
    
    // 创建路径
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(150,20)];
    [path2 addLineToPoint:CGPointMake(150, 280)];
    // 将路径添加进当前的上下文中
    CGContextAddPath(ctf, path2.CGPath);
    
    // 从上下文状态栈中恢复上下文的状态
    CGContextRestoreGState(ctf);
    
    // 设置上下文的状态
//    CGContextSetLineWidth(ctf, 1);
//    [[UIColor blackColor] set];
    // 将上下文中的内容显示在View上
    CGContextStrokePath(ctf);
    
}
@end
