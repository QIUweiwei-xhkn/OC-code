//
//  main.m
//  04-ARC基本概念
//
//  Created by wei wei on 2023/10/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    /*
//        Person *p = [[[Person alloc] init] autorelease];
        // 默认情况下所有的指针都是强指针
        Person *p = [[Person alloc] init];
//        [p retain];
//        [p release];
    */
    
    /*
     {
         // ARC的判断准则: 只要没有强指针指向对象, 对象就会释放
         // 默认情况下所有的指针都是强指针
 //        Person *p = [[Person alloc] init];
 //        p = nil;
         
 //        // 强指针
 //        __strong Person *p = [[Person alloc] init];
 //        // 弱指针
 //        __weak Person *p2 = p;
 //        p = nil;

         // 在开发中, 千万不要使用一个弱指针保存一个刚刚创建的对象
         // 立即释放
         __weak Person *p = [[Person alloc] init];
     }
     */
    
    Person *p = [[Person alloc] init];
    p = nil;
    return 0;
}
