//
//  ViewController.m
//  09-GCD的常用函数
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self once];
}

- (void)delay {
    // 1.延迟实现的第一种方法
//    [self performSelector:@selector(task) withObject:self afterDelay:2.0];
    
    // 2.延迟实现的第二种方法
//    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(task) userInfo:nil repeats:YES];
    
    // 3.GCD
    //  DISPATCH_QUEUE_PRIORITY_DEFAULT 0
//    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*
     第一个参数：DISPATCH_TIME_NOW 从现在开始计算时间
     第二个参数：延迟的时间 2.0 GCD时间单位：纳秒
     第三个參数：队列
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 2.0 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"GCD------%@", [NSThread currentThread]);
    });
    
}
 
// 一次性代码
// 不能放在懒加载中
// 常用在单例模式中 
- (void)once {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"once_______");
    });
}

- (void)task {
    NSLog(@"task----%@", [NSThread currentThread]);
}
@end
