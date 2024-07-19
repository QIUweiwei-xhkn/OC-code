//
//  ViewController.m
//  02-了解-pthread的简单使用
//
//  Created by wei wei on 2024/7/18.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    NSLog(@"%@", [NSThread currentThread]);
    
    // 1.创建新的线程对象
    pthread_t thread;
    
    // 2.创建线程
    /*
     第一个参数：线程对象，传递地址
     第二个参数：线程的属性，可为null
     第三个参数：指向函数的指针
     第四个参数：函数的参数，可为null
     */
    pthread_create(&thread, NULL, task, NULL);
    
    // 1.创建新的线程对象
    pthread_t thread2;
    
    // 2.创建线程
    /*
     第一个参数：线程对象，传递地址
     第二个参数：线程的属性，可为null
     第三个参数：指向函数的指针
     第四个参数：函数的参数，可为null
     */
    pthread_create(&thread2, NULL, task, NULL);

}

void * task(void * param) {
    NSLog(@"%@", [NSThread currentThread]);
    return NULL;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
