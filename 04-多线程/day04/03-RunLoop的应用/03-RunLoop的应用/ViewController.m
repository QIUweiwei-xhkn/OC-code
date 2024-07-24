//
//  ViewController.m
//  03-RunLoop的应用
//
//  Created by wei wei on 2024/7/23.
//

#import "ViewController.h"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, strong) NSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)createBtnClick:(id)sender {
    // 1.创建线程
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(task1) object:nil];
    // 2.启动线程
    [self.thread start];
}
- (IBAction)continueBtnClick:(id)sender {
//    [self.thread start];
    
    [self performSelector:@selector(task2) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)task1  {
    NSLog(@"task1------%@", [NSThread currentThread]);
//    while (1) {
//        NSLog(@"task1------%@", [NSThread currentThread]);
//    }
    
    // 解决方法：开启runloop
    // 1.创建runloop
    // 获得子线程对应的runloop
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    // 2.给runloop添加timer或是source避免创建完直接退出
    // 2.1 添加timer(麻烦)
//    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate now] interval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
//    // timer添加到runloop上
//    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    
    // 2.2 添加source
    [runLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    
    // 3.开启runloop
    [runLoop run];
    
    NSLog(@"end");
}

- (void)task2  {
    NSLog(@"task2------%@", [NSThread currentThread]);
}

-(void)run {
    NSLog(@"%s",__func__);
}

// 自动缓存池的创建和销毁 
// 第一次创建：启动runloop
// 最后一次销毁：runloop退出的时候
// 其他时候的创建和销毁：当runloop即将睡眠的时候销毁之前的释放池，重新创建一个新的
@end
