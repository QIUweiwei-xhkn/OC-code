//
//  main.m
//  05-局部变量和全局变量成员变量的区别
//
//  Created by wei wei on 2023/9/10.
//

#import <Foundation/Foundation.h>
@interface Person:NSObject {
    // 成员变量不可以在定义的同时初始化
    int age;
}
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    int num; // 全局变量 
    {
        int value; // 局部变量
    };
    return 0;
}
