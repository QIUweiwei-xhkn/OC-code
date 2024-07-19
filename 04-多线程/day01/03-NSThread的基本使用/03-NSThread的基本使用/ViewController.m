//
//  ViewController.m
//  03-NSThread的基本使用
//
//  Created by wei wei on 2024/7/18.
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
    [self createNewThread1];
}

// 1.alloc init 创建线程 需要手动启动线程
//  线程的生命周期：当任务执行完毕之后被释放
- (void)createNewThread1 {
    // 1.创建线程
    /*
     第一个参数：目标对象 self
     第二个参数：方法选择器， 调用方法
     第三个参数：上述调用方法的参数 可为nil
     */
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"ABC"];
    thread.name = @"线程1";
    // 线程的优先级 取值范围 0.0~1.0 之间 最高是1.0 默认优先级是0.5 已淘汰 现用qualityOfService 是个枚举值
    thread.threadPriority = 1.0;
    // 启动线程
    [thread start];
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"ABC"];
    thread1.name = @"线程2";
    thread1.threadPriority = 0.1;
    [thread1 start];
    
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"ABC"];
    thread2.name = @"线程3";
    [thread2 start];
}

// 2.分离子线程，自动启动线程
- (void)createNewThread2 {
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"分离子线程"];
}

// 3.开启一条后台线程，自动启动线程。
- (void)createNewThread3 {
    [self performSelectorInBackground:@selector(run:) withObject:@"开启一条后台线程"];
}

- (void)run:(NSString *)param {
//    NSLog(@"run------%@------NSStirng %@", [NSThread currentThread],  [NSThread currentThread].name);
    for(NSInteger i = 0; i < 100; i++) {
        NSLog(@"run--%zd -- %@", i, [NSThread currentThread].name);
    }
}
@end
