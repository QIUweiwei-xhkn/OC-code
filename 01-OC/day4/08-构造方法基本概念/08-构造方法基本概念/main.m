//
//  main.m
//  08-构造方法基本概念
//
//  Created by wei wei on 2023/9/24.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    /*
     在OC中init开头的方法, 我们称之为构造方法
     构造方法的用途: 用于初始化一个对象, 让某个对象一创建出来就拥有某些属性和值
     */
    Person *p1 = [[Person alloc] init];
//    p1.age = 6;
    NSLog(@"%i",p1.age);
    
    return 0;
}
