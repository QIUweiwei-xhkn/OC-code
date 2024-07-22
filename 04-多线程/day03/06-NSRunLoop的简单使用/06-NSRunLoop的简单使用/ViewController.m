//
//  ViewController.m
//  06-NSRunLoop的简单使用
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1. 获得主线程的RunLoop
    NSRunLoop *mianRunLoop = [NSRunLoop mainRunLoop];
    
    // 2.获得当前线程的RunLoop
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    
    NSLog(@"mianRunLoop -- %p,   currentRunLoop -- %p", mianRunLoop, currentRunLoop);
    
    // core Fundation
    NSLog(@"%p", CFRunLoopGetMain());
    NSLog(@"%p", CFRunLoopGetCurrent());
    
    // fundation --> core fundation
    NSLog(@"%p", mianRunLoop.getCFRunLoop);
    
    // runLoop和线程是一一对应的关系
    // 主线程的RunLoop已经创建，但是子线程的需要手动创建
    [[[NSThread alloc] initWithTarget:self selector:@selector(run) object:self] start];
}

// 在runloop中有多个运行模式，但是runloop只能选择一种模式运行
//  mode里面至少要有一个timer或者是source
- (void)run {
    // 如何创建子线程对应的runLoop, currentRunLoop懒加载的
    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    NSLog(@"%@", [NSThread currentThread]);
}

@end
