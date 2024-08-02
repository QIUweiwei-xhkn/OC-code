//
//  ViewController.m
//  07-extern和const联合使用
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
#import "GlobeConst.h"

// 开发中一般会将全局变量放在一个全局文件家中统一保存
//NSString * const name = @"name";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSUserDefaults standardUserDefaults] setValue:@"123" forKey:discover_name];
}


@end
