//
//  ViewController.m
//  02-const和宏的区别
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
#define QUsersDefault [NSUserDefaults standardUserDefaults]
#define QNameKey @"name"
CGFloat const a = 10;
@interface ViewController ()

@end
// 常用字符串，常见基本变量 定义宏

// const
// 苹果一直推荐我们使用const，而不是宏

/*
     const与宏的区别（面试题）
     1.编译时刻 宏：预编译 const：编译
     2.编译检查 宏没有编译检查，const有编译检查
     3.宏的好处 定义函数，方法，const不可以
     4.宏的坏处 大量使用宏，会导致预编译时间过达
 
     blog：太量使用宏，会导致内存暴增 ❌
 */

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str1 = [[NSString alloc] init];
    NSString *str2 = [[NSString alloc] init];
    NSString *str3 = [[NSString alloc] init];
    NSLog(@"%p, %p, %p", str1, str2, str3);
    
    [QUsersDefault setValue:@"aaa" forKey:QNameKey];
    [QUsersDefault objectForKey:QNameKey];
}


@end

