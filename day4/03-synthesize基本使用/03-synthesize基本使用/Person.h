//
//  Person.h
//  03-synthesize基本使用
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    @public
    int _age;
    int age;
    int _number;
}

/*
@porperty是一个编译器指令
 在Xocde4.4之前, 可以使用@porperty来代替getter/setter方法的声明
 也就是说我们只需要写上@porperty就不用写getter/setter方法的声明
 
 编译器只要看到@property, 就知道我们要生产某一个属性的getter/setter方法的声明
 
 - (void)setAge:(int)age;
 - (int)age;
 */
@property int age;
@end

NS_ASSUME_NONNULL_END
