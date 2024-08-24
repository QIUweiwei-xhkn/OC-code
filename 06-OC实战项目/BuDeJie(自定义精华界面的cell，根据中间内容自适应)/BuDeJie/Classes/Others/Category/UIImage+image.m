//
//  UIImage+image.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/9.
//

#import "UIImage+image.h"

@implementation UIImage (image)
+ (UIImage *)imageRenderOriginalWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (instancetype)qww_circleImage {
    UIImage *image = self;
    // 1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 2);
    // 2.描述裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 3.设置裁剪区域
    [path addClip];
    // 4.画图片
    [image drawAtPoint:CGPointZero];
    // 5.取出图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)qww_circleImageName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [image qww_circleImage];
}
@end
