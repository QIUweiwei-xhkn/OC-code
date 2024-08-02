//
//  ViewController.m
//  04-开发中const使用场景
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"

@interface ViewController ()

@end
/*
     1.修饰全局变量 => 全局只读变量 ==>代替宏
     2.修饰方法中参数
 */

#define QNameKey @"name"
NSString * const name = @"name";

@implementation ViewController
- (void)test:(int const *)a {
//    *a = 3; // 报错 Read-only variable is not assignable
}

- (void)viewDidLoad {
    [super viewDidLoad];
    int a = 0;
    [self test:&a];
    [[NSUserDefaults standardUserDefaults] setObject:@"123" forKey:name];
}


@end
