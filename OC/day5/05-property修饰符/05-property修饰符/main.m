//
//  main.m
//  05-property修饰符
//
//  Created by wei wei on 2023/10/13.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    Room *r = [Room new];
    
//    Car *c =[Car new];
//    Dog *d = [Dog new];
//    
//    p.room = r;
//    p.car = c;
//    p.dog = d;
//    
//    [d release];
//    [c release];
//    [r release];
//    [p release];
    
    p.room = r;
    [r release];
    
//    // 换房了, 如果set方法中没有release旧值, 就会内存泄露
//    Room *r2 = [Room new];
//    p.room = r2;
//    [r2 release];
    
    // 重复赋值
    p.room = r;
    
    [p release];
    return 0;
}
