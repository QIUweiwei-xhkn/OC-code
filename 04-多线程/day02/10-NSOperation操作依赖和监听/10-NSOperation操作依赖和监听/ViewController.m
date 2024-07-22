//
//  ViewController.m
//  10-NSOperation操作依赖和监听
//
//  Created by wei wei on 2024/7/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.创建队列
    // 默认是并发队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    
    // 2 .封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4-----%@", [NSThread currentThread]);
    }];
    
    op3.completionBlock = ^{
        NSLog(@"完成操作----- %@", [NSThread currentThread]);
    };
    
    // 3.添加操作依赖
    // 注意：不能循环依赖
    // 可以跨队列依赖
    [op1 addDependency:op4];
    [op4 addDependency:op3];
    [op3 addDependency:op2];
    
    // 4.添加操作到队列启动
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue  addOperation:op3];
    [queue2 addOperation:op4];
}
@end
