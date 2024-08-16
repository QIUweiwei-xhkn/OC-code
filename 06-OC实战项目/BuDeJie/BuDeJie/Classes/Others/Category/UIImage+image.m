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
@end
