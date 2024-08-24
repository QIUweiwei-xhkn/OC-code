//
//  UIImage+image.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (image)
+ (UIImage *)imageRenderOriginalWithImageName:(NSString *)imageName;

- (instancetype)qww_circleImage;

+ (instancetype)qww_circleImageName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
