//
//  QCar.h
//  01-xib的基本使用(车模型的定义)
//
//  Created by wei wei on 2024/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCar : NSObject
/** 图片   */
@property(nonatomic,copy) NSString *image;
/** 标题   */
@property(nonatomic,copy) NSString *title;
/** 子标题   */
@property(nonatomic,copy) NSString *subTitle;
/** 跟帖   */
@property(nonatomic,copy) NSString *follow;

// 提供快速创建的构造方法

@end


NS_ASSUME_NONNULL_END
