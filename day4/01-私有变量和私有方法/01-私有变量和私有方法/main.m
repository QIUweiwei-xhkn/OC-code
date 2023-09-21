//
//  main.m
//  01-私有变量和私有方法
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *person = [[Person alloc] init];
    //无论使用那个成员变量修饰符修饰成员变量，我们都可以在其他类中看到这个变量，但是有的修饰符修饰的成员对象我们不能操作
//    person->_age;
//    person->_height;
//    person->_name;
//    person->_weight;
    
    
    // 成员变量既可以写在@interface中，也可以写在@implementation中定义
    // 写在@implementation中的变量，默认是私有成员变量，并且其与用@private修饰的不太一样，@implementation中的成员变量在其他类中无法查看，也不能访问，
//    [person test];
    
//    id pp = [[Person alloc] init];
//    [pp test];
    
    [person performSelector:@selector(test)];
    return 0;
}
