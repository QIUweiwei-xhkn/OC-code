//
//  ViewController.m
//  07-block开发使用场景（当作参数使用）
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"
#import "CalculatorManager.h"

@interface ViewController ()

@end

// 怎么区分参数是block，就看有没有^，只要有^。把block当做参数
// 把block当做参数，并不是马上就调用Block，什么时候调用，由方法内部决定
// 什么时候需要把block当做參数去使用：做的事情由外界决定，但是什么时候做由内部决定，

/*
     需求：封装一个计算器，提供一个计算方法，怎么计算由外界决定，什么时候计算由内部决定。
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [UIView animateWithDuration:2 animations:^{
//        <#code#>
//    }];
    
    CalculatorManager *calmanager = [[CalculatorManager alloc] init];
    [calmanager calculate:^NSInteger(NSInteger result){
        result += 5;
        result += 2;
        result *= result;
        return result;
    }];
    
    NSLog(@"%ld", calmanager.result);
}


@end
