//
//  ViewController.m
//  01-了解-耗时操作
//
//  Created by wei wei on 2024/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    for (NSInteger i = 0; i < 100000; i++) {
        NSLog(@"%zd----%@", i, [NSThread currentThread]);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.获得主线程
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"%@", mainThread);
    
    // 2.获得当前线程
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"%@", currentThread);
    
    // 3.判断主线程的方法
    // 3.1  number = 1
    // 3.2 类方法
    BOOL isMainThread1 = [NSThread isMainThread];
    NSLog(@"%d", isMainThread1);
    
    // 3.3 对象方法
    BOOL isMainThread2 = [currentThread isMainThread];
    NSLog(@"%d", isMainThread2 );
}


@end
