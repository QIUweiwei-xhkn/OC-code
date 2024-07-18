// 
//   DrawView.h
//   07-画板
// 
//   Created by wei wei on 2024/7/10.
// 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawView : UIView
/** 从相册中获得的图片   */
@property(nonatomic, strong) UIImage *image;

// 清屏
- (void)clear;
// 撤销
- (void)undo;
// 橡皮擦
- (void)erase;
// 设置线的宽度
- (void)setLineWidth:(CGFloat)lineWidth;
// 设置线的颜色
- (void)setLineColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
