//
//  ViewController.m
//  07-了解-NSOperation的基本使用
//
//  Created by wei wei on 2024/7/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self blockOperation];
}


 - (void)invocationOperation {
    // 1，创建操作，封装任务
    /*
     第一个参数：目标对象
     第二个参数：调用方法名称
     第三个参数：前面调用方法的参数
     */
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    // 2.启动｜执行操作
    [operation start];
}

- (void)blockOperation {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1----%@", [NSThread currentThread]);
    }];
    [operation start];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2----%@", [NSThread currentThread]);
    }];
    [operation2 start];
    
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3----%@", [NSThread currentThread]);
    }];
    
    
    // 追加任务
    // 注意：如果一个操作中的任务数量大于1，那么会开子线程并发执行任务
    // 注意：不一定是子线程，有可能是主线程
    [operation3 addExecutionBlock:^{
        NSLog(@"4-----%@", [NSThread currentThread]);
    }];
    
    [operation3 addExecutionBlock:^{
        NSLog(@"5-----%@", [NSThread currentThread]);
    }];
    
    [operation3 addExecutionBlock:^{
        NSLog(@"6-----%@", [NSThread currentThread]);
    }];
    
    [operation3  start];
}

- (void)download {
    NSLog(@"%s------%@", __func__, [NSThread currentThread]);
}
@end
