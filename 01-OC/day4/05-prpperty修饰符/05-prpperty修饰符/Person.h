//
//  Person.h
//  05-prpperty修饰符
//
//  Created by wei wei on 2023/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/*
 如果给一个属性同时提供了getter/setter方法, 那么我们称这个属性为可读可写属性
 如果只提供了getter方法, 那么我们称这个属性为只读属性
 如果只提供了setter方法, 那么我们称这个属性为只写属性
 如果既没有提供getter也没有提供setter方法, 那么我们称这个属性为私有属性
 
 格式:
 @property(属性修饰符) 数据类型 变量名称;
 */

@interface Person : NSObject

// readwrite: 代表既生成getter方法 , 也生成setter方法
// 默认情况下 @property就是readwrite的
//@property(readwrite) int age;
//@property double height;
//@property double weight;

// readonly: 代表只生成getter方法不生成setter方法
@property(readonly) NSString *name;

- (void)setHeight:(double)height;
 - (double)abc;
@property(getter=abc) double height;

/*
 - (void)setWeight:(double)weight;
 - (void)tiZhong:(double)weight;
 */

// 是否已婚
// 程序员之间有一个约定, 一般情况下获取BOOL类型的属性的值, 我们都会将获取的方法名称改为isXXX
@property(getter=isMarried) BOOL married;

@property(setter=tiZhong:) double weight;
@end

NS_ASSUME_NONNULL_END
