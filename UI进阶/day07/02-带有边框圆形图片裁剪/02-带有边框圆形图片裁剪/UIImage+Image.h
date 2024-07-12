//
//  UIImage+Image.h
//  02-带有边框圆形图片裁剪
//
//  Created by wei wei on 2024/7/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Image)

/// 生成一张带有边框的圆形图片
/// - Parameters:
///   - borderW: 边框的宽度
///   - color: 边框的颜色
///   - image: 要裁剪的图片 
+ (UIImage *)imageWihtBorderW:(CGFloat)borderW WithColor:(UIColor *)color WithImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
