//
//  UIImage+Image.m
//  02-带有边框圆形图片裁剪
//
//  Created by wei wei on 2024/7/10.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+ (UIImage *)imageWihtBorderW:(CGFloat)borderW WithColor:(UIColor *)color WithImage:(UIImage *)image{
    // 2.开启一个图片上下文
    CGFloat radius = image.size.width;
    if(image.size.width > image.size.height)
        radius = image.size.height;
    CGSize size = CGSizeMake(radius + borderW * 2, radius + borderW * 2);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 3.绘制大圆显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    // 4.绘制一个小圆，设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, radius, radius)];
    [clipPath addClip];
    // 5.把图片绘制到图片上下文中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    // 6.从图片上下文得到图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 7.关闭图片上下文
    UIGraphicsEndImageContext();
    return newImage;
}
@end
