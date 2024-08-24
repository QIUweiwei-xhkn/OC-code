//
//  UIView+frame.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (frame)
/*
     写分类：避免跟其他开发者产生冲突，加前缀
 */
/** 宽   */
@property(nonatomic, assign) CGFloat qww_width;
@property(nonatomic, assign) CGFloat qww_height;
@property(nonatomic, assign) CGFloat qww_x;
@property(nonatomic, assign) CGFloat qww_y;
@property(nonatomic, assign) CGFloat qww_centerX;
@property(nonatomic, assign) CGFloat qww_centerY;

+ (instancetype)qww_viewFromXib;
@end

NS_ASSUME_NONNULL_END
