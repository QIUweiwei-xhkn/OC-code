//
//  ViewController.m
//  02-CFRunLoop相关类介绍（Source和Observer）
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)sourceBtnClick:(id)sender {
    // 用户主动调用的是source0，非端口
    // 系统调用source0=1，端口 port
    NSLog(@"%s",__func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self observer];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(task) userInfo:nil repeats:YES];
}

- (void)task {
    NSLog(@"%s",__func__);
}

-(void)observer {
//    // 这两种方法添加observer是不一样的
//    [NSRunLoop mainRunLoop] addObserver:<#(nonnull NSObject *)#> forKeyPath:<#(nonnull NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(nullable void *)#>];
//    
//    CFRunLoopAddObserver(<#CFRunLoopRef rl#>, <#CFRunLoopObserverRef observer#>, <#CFRunLoopMode mode#>);
//    
//    // 这两个添加timer是等价的
//    [[NSRunLoop mainRunLoop] addTimer:<#(nonnull NSTimer *)#> forMode:<#(nonnull NSRunLoopMode)#>]; // Fundation
//    CFRunLoopAddTimer(<#CFRunLoopRef rl#>, <#CFRunLoopTimerRef timer#>, <#CFRunLoopMode mode#>); // Core Fundation
    
    // 1.创建监听者
    /*
     第一个参数：要创建的空间大小，传默认
     第二个参数：要监听的状态 kCFRunLoopAllActivities 所有状态
     第三个参数：YES 表示持续监听
     第四个参数：优先级
     第五个参数：当前状态改变的时候回调
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        /*
         kCFRunLoopEntry = (1UL << 0),          即将进入runloop
         kCFRunLoopBeforeTimers = (1UL << 1),   即将处理timer事件
         kCFRunLoopBeforeSources = (1UL << 2),  即将处理source事件
         kCFRunLoopBeforeWaiting = (1UL << 5),  即将陷入休眠
         kCFRunLoopAfterWaiting = (1UL << 6),   被唤醒
         kCFRunLoopExit = (1UL << 7),           runloop退出
         kCFRunLoopAllActivities = 0x0FFFFFFFU  全部事件
         */
        
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"即将进入runloop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将陷入休眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                break;
            default:
                break;
        }
    });
    
    /*
     第一个参数：要监听哪个runloop
     第二个参数：观察者
     第三个参数：运行模式
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    //  kCFRunLoopDefaultMode 等价于  NSDefaultRunLoopMode
    // kCFRunLoopCommonModes 等价于 NSRunLoopCommonModes
}
@end
