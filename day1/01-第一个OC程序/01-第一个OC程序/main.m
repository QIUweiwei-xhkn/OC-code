//
//  main.m
//  01-第一个OC程序
//
//  Created by wei wei on 2023/9/9.
//

#import <Foundation/Foundation.h> // import 自动防止重复拷贝
#include <stdio.h>
#import "C.h"
int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    // 1.OC是兼容C的
    printf("c Hello world\n");
    // 会自动换行
    NSLog(@"OC Hello world");
    
    NSLog(@"sum = %d",sum(10, 20));
    return 0;
}
