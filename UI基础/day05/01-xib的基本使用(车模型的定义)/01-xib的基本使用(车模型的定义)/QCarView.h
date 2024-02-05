//
//  QCarView.h
//  01-xib的基本使用(车模型的定义)
//
//  Created by wei wei on 2024/2/1.
//

#import <UIKit/UIKit.h>
@class QCar;

NS_ASSUME_NONNULL_BEGIN

@interface QCarView : UIView
/** 车模型   */
@property(nonatomic, strong) QCar *car;

// 提供快速构造方法
// ……
@end

NS_ASSUME_NONNULL_END
