//
//  ViewController.m
//  07-NSRunLoop相关类
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 在runloop中有多个运行模式，但是runloop只能选择一种模式运行
//  mode里面至少要有一个timer或者是source

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 在子线程中默认的scheduledTimerWithTimeInterval不会调用，没有runloop
    [NSThread detachNewThreadSelector:@selector(timer2) toTarget:self withObject:nil];
//    [self timer2];
}

-(void)timer {
    // 1.创建一个定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 2.添加定时器到runloop
    /*
     第一个参数：定时器
     第二个参数：runLoop的运行模式
     */
    // NSDefaultRunLoopMode:默认模式
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    // UITrackingRunLoopMode：界面追踪模式
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
    // NSRunLoopCommonModes = NSDefaultRunLoopMode + UITrackingRunLoopMode
    // 占用，标签，凡是添加到NSRunLoopCommonModes中的事件都会被同时添加到打上commmon标签的运行模式上
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)run {
    NSLog(@"run----%@----%@", [NSThread currentThread], [NSRunLoop currentRunLoop].currentMode);
}

-(void)timer2 {
    // 创建runloop（懒加载）
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 不需要手动加到runloop上 该方法内部自动添加到runloop中，并且设置运行模式为默认
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 开启runloop
    [runloop run];
    
}
@end
