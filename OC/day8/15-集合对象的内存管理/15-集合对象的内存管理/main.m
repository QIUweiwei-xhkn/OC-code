//
//  main.m
//  15-集合对象的内存管理
//
//  Created by wei wei on 2023/11/28.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1. 如果将一个对象添加到一个数组中, 那么数组会对对象进行一个retain
        /*
         Person *p = [[Person alloc] init];
         NSLog(@"reatinCount = %lu", [p retainCount]);
 //        NSMutableArray *arrM = [NSMutableArray array];  不用自己释放
         NSMutableArray *arrM = [[NSMutableArray alloc] init];
         [arrM addObject:p];
         NSLog(@"reatinCount = %lu", [p retainCount]);
         [p release];
         NSLog(@"reatinCount = %lu", [p retainCount]);
         // 当数组对象释放之后, 会给数组中所有的对象发送一条release消息
         [arrM release];
         */

        Person *p = [[Person alloc] init];
        NSLog(@"reatinCount = %lu", [p retainCount]);
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        [arrM addObject:p];
        NSLog(@"reatinCount = %lu", [p retainCount]);
        [p release];
        NSLog(@"reatinCount = %lu", [p retainCount]);
        // 当数组移除一个对象之后, 会给这个对象发送一条release消息
        [arrM removeObject:p];
    }
    return 0;
}
