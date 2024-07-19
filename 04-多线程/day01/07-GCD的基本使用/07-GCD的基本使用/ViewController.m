//
//  ViewController.m
//  07-GCD的基本使用
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self syncMain];
    // 新创建一个子线程，没有死锁了
    [NSThread detachNewThreadSelector:@selector(syncMain) toTarget:self withObject:nil];
}

// 异步函数+并行队列 ：具备开线程的能力，会开启一条线程，队列中的任务是异步/并发执行
- (void)asyncConcurrent {
    // 1.创建队列(原来不存在）
    /*
     第一个参数：C语言的字符串，标签
     第二个參数：队列的类型
     DISPATCH_QUEUE_CONCURRENT: 并发队列
     DISPATCH_QUEUE_SERIAL: 串行
     */
    //    dispatch_queue_t queue = dispatch_queue_create("com.520it.downloada", DISPATCH_QUEUE_CONCURRENT);
    
    // 获得全局并发队列（获得系统存在的）
    /*
     第一个参数：优先级
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2)
     #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
     第二个参数：
     */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 2.1 封装任务 2.2 添加任务到队列
    /*
     第一个参数：队列
     第二个参数：要执行的任务
     */
    dispatch_async(queue, ^{
        NSLog(@"download1__________ %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2__________ %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3__________ %@", [NSThread currentThread]);
    });
}

// 异步函数和串行队列 ：可能会开启多条线程，队列中的任务是串行执行
- (void)asyncSerial {
    dispatch_queue_t queque = dispatch_queue_create("com.530it.download", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queque, ^{
        NSLog(@"download1-------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queque, ^{
        NSLog(@"download2-------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queque, ^{
        NSLog(@"download3-------%@", [NSThread currentThread]);
    });
}

// 同步函数+并行队列：不会开线程，串行执行任务
- (void)syncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        NSLog(@"download1-------%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2-------%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3-------%@", [NSThread currentThread]);
    });
}

// 同步函数+串行队列：不会开线程，串行执行任务
- (void)syncSerial {
    dispatch_queue_t queue = dispatch_queue_create("downlaod", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"download1-------%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2-------%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3-------%@", [NSThread currentThread]);
    });
}

// 异步函数+主队列：所有任务都在主线程中执行，不会开线程
- (void)asyncMain {
    // 获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 异步函数
    dispatch_async(queue, ^{
        NSLog(@"download1__________ %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2__________ %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3__________ %@", [NSThread currentThread]);
    });
}

// 同步函数+主队列：程序崩了，死锁
// 注意：如果该方法在主线程中执行，那么所有的任务在主线程中执行
- (void)syncMain {
    // 获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"start----");
    // 同步函数： 立刻马上执行，如果我没有执行完毕，那么后面的也别想执行
    //异步函数：如果我没有找行完毕，那么后面的也可以执行
    dispatch_sync(queue, ^{
        NSLog(@"download1__________ %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2__________ %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3__________ %@", [NSThread currentThread]);
    });
    NSLog(@"end ----");
}
@end
