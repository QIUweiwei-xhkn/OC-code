//
//  WheelView.h
//  01-转盘
//
//  Created by wei wei on 2024/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WheelView : UIView
// 快速创建wheelView对象
+(instancetype)wheelView;

// 开始旋转
- (void)rotation;

// 停止旋转
- (void)stop;
@end

NS_ASSUME_NONNULL_END
