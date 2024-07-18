//
//  UIImage+Q.m
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import "UIImage+Q.h"

@implementation UIImage (Q)
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
