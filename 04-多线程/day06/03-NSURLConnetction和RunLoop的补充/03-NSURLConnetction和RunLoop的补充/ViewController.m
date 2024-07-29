//
//  ViewController.m
//  03-NSURLConnetction和RunLoop的补充
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self NewThreaDelegate2];
}

- (void)delegate {
    // 1.确定url
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.设置代理 默认在主线程中调用(异步，不会阻塞主线程)
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    // 设置代理方法在那个线程中调用
    // [[NSOperationQueue alloc] init] 开子线程
    // [NSOperationQueue mainQueue] 不能这样设置 // 不会调用代理方法
//    [connection setDelegateQueue:[[NSOperationQueue alloc] init]];
    [connection setDelegateQueue:[NSOperationQueue mainQueue]];
    NSLog(@"----------");
}

- (void)delegate2 {
    // 1.确定url
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.设置代理 默认在主线程中调用(异步，不会阻塞主线程)
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    
    [connection setDelegateQueue:[[NSOperationQueue alloc] init]];
    
    // 开始发送请求
    [connection start];
    NSLog(@"----------");
}

- (void)NewThreaDelegate {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 1.确定url
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
        // 2.创建请求
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        // 3.设置代理 默认在主线程中调用(异步，不会阻塞主线程)
        //  the calling thread’s run loop must be operating in the default run loop mode.
        // //该方法内部其实会将connect对象作为一个source添加到当前的runloop中，指定运行模式为默认
        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        // 设置代理方法在那个线程中调用
        [connection setDelegateQueue:[[NSOperationQueue alloc] init]];
        
        // 创建runloop并启动
//        [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1000]];
        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"----------");
    });
}

- (void)NewThreaDelegate2 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 1.确定url
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
        // 2.创建请求
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        // 3.设置代理 默认在主线程中调用(异步，不会阻塞主线程)
        // 如果startImmediately 为YES和NewThreaDelegate一样
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        
        [connection setDelegateQueue:[[NSOperationQueue alloc] init]];
        
        // 开始发送请求
        //  If you don’t schedule the connection in a run loop or an operation queue before calling this method, the connection is scheduled in the current run loop in the default mode
        // 如果connect对象没有添加到runLoop中，那么该方法内部会自动的添加到runloop
        // 注意：如果当前的runloop没有开启，那么该方法内部会自动获得当前线程对应的runloop对象并且开启
        [connection start];
        NSLog(@"----------");
    });
}

#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"--%@--", [NSThread currentThread]);
}
@end
