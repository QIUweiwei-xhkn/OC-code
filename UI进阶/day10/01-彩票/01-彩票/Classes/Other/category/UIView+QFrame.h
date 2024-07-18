//
//  UIView+QFrame.h
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (QFrame)
// 在分类中 @property 只会生成get set方法，并不会生成下划线的成员属性
/** width   */
@property(nonatomic, assign) CGFloat width;
/** height   */
@property(nonatomic, assign) CGFloat height;
/** x   */
@property(nonatomic, assign) CGFloat x;
/** y   */
@property(nonatomic, assign) CGFloat y;

//- (CGFloat)width;
//
//- (void)setWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
