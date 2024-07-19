//
//  ViewController.m
//  04-了解—线程的状态
//
//  Created by wei wei on 2024/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建进程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(task) object:nil];
    // 启动进程 就绪<------->运行
    [thread start];
}

- (void)run {
    NSLog(@"run--- %@", [NSThread currentThread]);
    
    // 阻塞进程
    // 方法一
//    [NSThread sleepForTimeInterval:2.0];
    // 方法二
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.0]];
    
    NSLog(@"end");
}

- (void)task {
    for(NSInteger i = 0; i < 100; i++) {
        if(i == 20) {
            [NSThread exit]; // 结束当前进程，任务结束前强制退出当前进程
//             break;  // 任务结束后自动结束当前进程
        }
        NSLog(@"task--%zd-- %@", i, [NSThread currentThread]);
    }
}
@end
