//
//  UIImageView+Download.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/21.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Download)
- (void)qww_setOriginImage:(NSString *)originImageURL andThumbnailImage:(NSString *)thunmbnailImageURL placehoderImage:(UIImage *)placehoderImage completed:(SDWebImageCompletionBlock)completedBlock;

/** 设置圆形头像 */
- (void)qww_setHeader:(NSString *)headerURL;
@end

NS_ASSUME_NONNULL_END
