//
//  ViewController.m
//  08-了解-NSOperationQueue的基本使用
//
//  Created by wei wei on 2024/7/20.
//

#import "ViewController.h"
#import "QOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self customWithOpertation];
}

- (void)customWithOpertation {
    // 1.创建操作
    QOperation *op1 = [[QOperation alloc] init];
    QOperation *op2 = [[QOperation alloc] init];
    // 2.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 3.添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
}

- (void)invocationOparation {
    // 1.创建操作
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download1) object:nil];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download2) object:nil];
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download3) object:nil];
    
    // 2.创建队列
    /*
     GCD:
     串行类型：create & 主队列
     并发类型：create & 全局并发队列
     NSOperation:
     主队列：［NSOperationQueue mainQueue］ 和GCD中的主队列一样，串行队列
     非主队列：［［NSOperationQueue alloc］ init］非常特殊（同时具备并发和串行的功能）
     //默认情况下，非主队列是并发队列
     */
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 3.添加操作到队列中执行
    [queue addOperation:op1];   // 内部调用了 [op1 start]
    [queue addOperation:op2];
    [queue addOperation:op3];
}

- (void)blockOperation {
    // 1.创建操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3----%@", [NSThread currentThread]);
    }];
    
    // 追加任务
    [op3 addExecutionBlock:^{
        NSLog(@"4----%@", [NSThread currentThread]);
    }];
    [op3 addExecutionBlock:^{
        NSLog(@"5----%@", [NSThread currentThread]);
    }];
    [op3 addExecutionBlock:^{
        NSLog(@"6----%@", [NSThread currentThread]);
    }];
    
    // 2.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 3.添加操作到队列 并发执行
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    // 简便方法
    //  1）创建操作，2）添加操作到队列中
    [queue addOperationWithBlock:^{
        NSLog(@"7----%@", [NSThread currentThread]);
    }];
}

- (void)download1 {
    NSLog(@"%s----%@", __func__, [NSThread currentThread]);
}
- (void)download2 {
    NSLog(@"%s----%@", __func__, [NSThread currentThread]);
}
- (void)download3 {
    NSLog(@"%s----%@", __func__, [NSThread currentThread]);
}
@end
