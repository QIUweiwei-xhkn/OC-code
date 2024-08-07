//
//  ViewController.m
//  08-block开发使用场景（当作返回值）
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"
#import "CalculatorManager.h"

//链式编程思想：把所有的语句用.号连接起来，好处：可读性非常好

/*
     需求：封装一个计算器，提供一个加号方法
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个计算管理者
    CalculatorManager *calManager = [[CalculatorManager alloc] init];
//    [calManager add:5];
//    [calManager add:5];
//    [calManager add:5];
//    [calManager add:5];
    
//    [[[[calManager add:5] add:5] add:5] add:5];
    
    calManager.add(5).add(5).add(5);
    
    NSLog(@"%ld", calManager.reslute);
}


@end
