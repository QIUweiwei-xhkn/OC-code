//
//  UIBarButtonItem+Item.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image WithHighlightedImage:(UIImage *)highlightImage addTarget:(nullable id)target action:(nullable SEL)action;

+(UIBarButtonItem *)itemWithImage:(UIImage *)image WithSelectedImage:(UIImage *)selectedImage addTarget:(id)target action:(SEL)action;

+(UIBarButtonItem *)backItemWithImage:(UIImage *)image WithSelectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
