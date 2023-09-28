//
//  Person.h
//  11-自定义构造方法
//
//  Created by wei wei on 2023/9/25.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property int age;
@property NSString *name;
/*
 自定义构造方法:
 其实就是自定义一个init方法
 1.一定是对象方法
 2.一定返回id/instancetype
 3.方法名称一定以init开头
*/
- (instancetype)initWithAge:(int)age;

// 一个类可以有0个或者多个自定义构造方法
- (instancetype)initWithName:(NSString*)name;

// 自定义构造方法可以有1个或多个参数
-(instancetype)initWithAge:(int)age andName:(NSString*)name;
@end

NS_ASSUME_NONNULL_END
