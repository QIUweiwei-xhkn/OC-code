//
//  main.m
//  21-单例ARC和MRC写法
//
//  Created by wei wei on 2023/12/2.
//

#import <Foundation/Foundation.h>
#import "Tools.h"

int main(int argc, const char * argv[]) {
    // ARC
    /*
     // 单例就是无论怎么创建都只能有一个实例对象
     // 如果地址相同就代表着是同一个实例对象
     Tools *t1 = [[Tools alloc] init]; //内部会调用allocWithZone
     Tools *t2 = [Tools new];  // [[alloc] init]  allocWithZone
     Tools *t3 = [Tools shareInstance];
 //    NSLog(@"%p, %p, %p", t1, t2, t3);
     Tools *t4 = [t3 copy];
     Tools *t5 = [t3 mutableCopy];
     NSLog(@"%p, %p, %p, %p, %p", t1, t2, t3, t4, t5);
     */

    // MRC
    Tools *t1 = [[Tools alloc] init];
    [t1 retain];
    [t1 retain];
    [t1 retain];
    NSLog(@"retainCount = %lu", [t1 retainCount]);
    NSLog(@"t1 = %p", t1);
    [t1 release];
    
    
    Tools *t2 = [Tools shareInstance];
    NSLog(@"retainCount = %lu", [t2 retainCount]);
    NSLog(@"t2 = %p", t2);
    [t2 release];
    return 0;
}
