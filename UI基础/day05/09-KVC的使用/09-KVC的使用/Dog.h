//
//  Dog.h
//  09-KVC的使用
//
//  Created by wei wei on 2024/2/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
/** 姓名   */
@property(nonatomic,copy) NSString *name;
/** 价格   */
@property(nonatomic, assign) float money;
@end

NS_ASSUME_NONNULL_END
