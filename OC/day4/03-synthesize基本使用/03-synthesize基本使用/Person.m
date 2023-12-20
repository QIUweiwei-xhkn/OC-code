//
//  Person.m
//  03-synthesize基本使用
//
//  Created by wei wei on 2023/9/21.
//

#import "Person.h"

@implementation Person
// 如果重写了setter方法, 那么property就只会生成getter方法
// 如果重写了getter方法, 那么property就只会生成setter方法
// 如果同时重写了getter/setter方法, 那么property就不会自动帮我们生成私有的成员变量
-(void)setAge:(int)age {
    if(age < 0) {
        age = 0;
    }
    _age = age;
}
@end
