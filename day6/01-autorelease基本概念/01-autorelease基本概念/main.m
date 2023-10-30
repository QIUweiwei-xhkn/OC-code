//
//  main.m
//  01-autorelease基本概念
//
//  Created by wei wei on 2023/10/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    /*
     @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p run];
        
        // 时时刻刻都关注对象什么时候被释放
        [p release];
        p = nil;
        
        [p run]; // (如果没有第17行是）给野指针发送消息
    }
    */
    
    // 创建一个自动释放池
    // 自动释放池只是将release延迟了而已
   /*
    @autoreleasepool {// 创建一个自动释放池
        Person *p = [[Person alloc] init]; // 1
        // 不用关心对象什么时候释放, 只要能够访问p的地方都可以使用p
        p = [p autorelease];
        // 只要调用了autorelease, 那么就不用调用release了
        [p retain]; // 2
        [p run];
        // 自动释放池销毁了, 给自动释放池中所有的对象发送一条release消息
    }
    */
    
    // autorelease其它写法
    // IOS 5.0 开始
    /*
     @autoreleasepool {
//        Person *p = [[Person alloc] init];
//        p = [p autorelease];
        
        Person *p = [[[Person alloc] init] autorelease];
        [p run];
    }
    */
    
    // IOS 5.0 前
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    Person *p = [[[Person alloc] init] autorelease];
    [p run];
    // 销毁一个自动释放池
    [pool release];
    return 0;
}
