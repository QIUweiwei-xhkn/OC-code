//
//  ViewController.m
//  04-通知补充
//
//  Created by wei wei on 2024/8/5.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) id observer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 通知顺序：一定要先监听，在发出
    // bug：监听不到通知，马上想到有可能先发出通知，在监听通知
    
    // 消息通知
    // 1.发送通知
    // 2.监听通知
    // 3.监听的注意点
    
    // 监听方法1
    // 异步监听， 监听不到可能是因为
    // 1.在异步线程，不能监听通知 ❌
    // 2.异步任务，执行顺序不确定 ✅
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNote) name:@"note" object:nil];
//    });
    
    // 监听方法2 更新UI，将queue设为主队列
    _observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"note" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull notification) {
            NSLog(@"%@",[NSThread currentThread]);
    }];
    // queue 为 nil,在发布消息的线程中执行block块
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 在异步线程中监听消息，主线程中发出消息，监听到消息是在主线程中执行任务
    // 在主线程中监听消息，异步线程中发出消息，监听到消息是在异步线程中执行任务
    // 总结：监听到消息是在发出消息的线程中执行任务
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // name:通知的名称
        // object:发送对象
        [[NSNotificationCenter defaultCenter] postNotificationName:@"note" object:nil];
//    });
}

- (void)test {
    // obsetver:观察者
    // selector：只要一监听到通知，就会调用观察者这个方法
    // name：通知名称
    // object：发出消息的对象
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNote) name:@"note" object:nil];
}

- (void)test2 {
    // name：通知名称
    // object：发出消息的对象
    // queue:决定block块在那个线程中执行，若为nil，这在发布通知的线程中执行
    // block块：监听到通知时立即执行block块
    // 注意；一定要移除观察者
    _observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"note" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull notification) {
            NSLog(@"%@",[NSThread currentThread]);
    }];
}


- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:_observer];
}

- (void)receiveNote {
    dispatch_async(dispatch_get_main_queue(), ^{
        // 更新UI
    });
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"%s",__func__);
}
@end
