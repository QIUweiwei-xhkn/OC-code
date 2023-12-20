//
//  ViewController.m
//  18-copy内存管理IOS
//
//  Created by wei wei on 2023/11/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建一个不可变字符串
    NSString *str = [[NSString alloc]initWithFormat:@"Qww"];
    NSLog(@"str = %lu", [str retainCount]);
}


@end
