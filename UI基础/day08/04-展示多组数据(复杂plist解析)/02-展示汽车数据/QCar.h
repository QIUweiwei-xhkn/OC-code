//
//  QCar.h
//  02-展示汽车数据
//
//  Created by wei wei on 2024/2/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCar : NSObject
/** 名称  */
@property(nonatomic,copy) NSString *name;

/** 图标  */
@property(nonatomic,copy) NSString *icon;

//+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon;

+ (instancetype)carWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
