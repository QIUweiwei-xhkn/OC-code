//
//  ViewController.m
//  01-GCD栅栏函数
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.创建队列
    // DISPATCH_QUEUE_PRIORITY_DEFAULT 0
    // 栅栏函数不能使用全局并发队列
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    // (在异步/并发队列中设置栅栏函数才有意义，串行队列已经是按顺序执行的）
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    
    // 2.异步函数
    dispatch_async(queue, ^{
        for(NSInteger i = 0; i < 100; i++) {
            NSLog(@"download1--------%zd-------%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for(NSInteger i = 0; i < 100; i++) {
            NSLog(@"download2--------%zd-------%@", i, [NSThread currentThread]);
        }
    });
    
    // 栅栏函数
    dispatch_barrier_async(queue, ^{
        NSLog(@"++++++++++++++++++++++++++++++");
    });
    
    dispatch_async(queue, ^{
        for(NSInteger i = 0; i < 100; i++) {
            NSLog(@"download3--------%zd-------%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for(NSInteger i = 0; i < 100; i++) {
            NSLog(@"download4--------%zd-------%@", i, [NSThread currentThread]);
        }
    });
}

@end
