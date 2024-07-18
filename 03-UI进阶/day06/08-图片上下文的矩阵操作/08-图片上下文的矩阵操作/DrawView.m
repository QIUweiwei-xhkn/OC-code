//
//  DrawView.m
//  08-图片上下文的矩阵操作
//
//  Created by wei wei on 2024/7/9.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 50)];
    [[UIColor redColor] set];
    
    // 矩阵操作(要在CGContextAddPath添加路径之前)
    // 平移
    CGContextTranslateCTM(ctf, 100, 140);
    
    // 缩放
    CGContextScaleCTM(ctf, 1.5, 1.5);
    
    // 旋转
    CGContextRotateCTM(ctf, M_PI_4);
    
    CGContextAddPath(ctf, path.CGPath);
    CGContextFillPath(ctf);
    
}

@end
