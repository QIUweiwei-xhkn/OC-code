//
//  QOperation.m
//  08-了解-NSOperationQueue的基本使用
//
//  Created by wei wei on 2024/7/20.
//

#import "QOperation.h"

@implementation QOperation

// 告知要执行的任务是什么
// 1.有利于代码隐蔽
// 2.复用
- (void)main {
    NSLog(@"main---%@", [NSThread currentThread]);
}
@end
