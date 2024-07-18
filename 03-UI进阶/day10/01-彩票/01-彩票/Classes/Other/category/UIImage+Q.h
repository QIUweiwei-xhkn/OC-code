//
//  UIImage+Q.h
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Q)

/// 返回一张不用渲染的图片
/// - Parameter name: 图片的名字
 + (UIImage *)imageWithRenderOriginalName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
