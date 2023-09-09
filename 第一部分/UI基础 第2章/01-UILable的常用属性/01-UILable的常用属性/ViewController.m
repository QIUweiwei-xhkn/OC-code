//
//  ViewController.m
//  01-UILable的常用属性
//
//  Created by wei wei on 2023/9/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加Lable
    UILabel *lable = [[UILabel alloc] init];
    [self.view addSubview:lable];
    lable.backgroundColor = [UIColor redColor];
    lable.frame = CGRectMake(100, 100, 200, 100);
    
    // 设置属性
    lable.text = @"Hello world Hello world Hello world Hello world Hello world Hello world";
    lable.textAlignment = NSTextAlignmentCenter;
//    lable.numberOfLines = 0; // 自动换行
//    lable.lineBreakMode = NSLineBreakByWordWrapping; // 自动换行
    
}


@end
