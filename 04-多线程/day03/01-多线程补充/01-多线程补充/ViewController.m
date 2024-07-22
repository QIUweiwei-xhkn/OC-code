//
//  ViewController.m
//  01-多线程补充
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"
#import "QOperation.h"
#import "QThread.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self thread];
}

- (void)operation {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    QOperation *op = [QOperation blockOperationWithBlock:^{
        NSLog(@"1--------%@", [NSThread currentThread]);
    }];
    
    [queue addOperation:op];    // 调用了[op start] ---》调用了main方法
}

- (void)thread {
    // 调用对象的mian方法
    QThread *thread = [[QThread alloc] init];
    
    [thread start];
}
@end
