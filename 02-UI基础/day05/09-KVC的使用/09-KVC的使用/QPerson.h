//
//  QPerson.h
//  09-KVC的使用
//
//  Created by wei wei on 2024/2/7.
//

#import <Foundation/Foundation.h>
@class Dog;

NS_ASSUME_NONNULL_BEGIN

@interface QPerson : NSObject

/** 姓名   */
@property(nonatomic,copy) NSString *name;
/** 年龄   */
@property(nonatomic, assign) int age;
/** 狗   */
@property(nonatomic, strong) Dog *dog;
/** 序号   */
@property(nonatomic,copy) NSString *no;

- (void)printAge;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)perosnWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
