//
//  Person.m
//  03-synthesize基本使用
//
//  Created by wei wei on 2023/9/21.
//

#import "Person.h"

@implementation Person
/**
 *  @synthesize是一个编译器指令，它可以简化我们getter/setter方法的
 *  实现什么是实现：在声明后面写上大括号就代表着实现
 *
 *  1.在@synthesize后面告诉编译器，需要实现哪个@property生成的声明
    2. 告诉@synthesize，需要将传入的值赋值给谁和返回谁的值给调用者
 */
//@synthesize age = _age;
//@synthesize age = _number;

// 如果@synthesize后没有告訴系统將传入的值賦值给谁，系统數认会赋值给和@synthesize后面写的名称同的成员变量
// _age?age;
@synthesize age;


//-(void)setAge:(int)age {
//    if(age < 0) {
//        age = 0;
//    }
//    _age = age;
//}
@end
