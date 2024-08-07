//
//  ViewController.m
//  06-block变量传递
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

//int a =  3;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     int a =  3;
//     static int a =  3;
    __block int a = 3;
    // 若block引用的是局部变量，block是值传递
    // 若block引用的是静态变量，全局变量，或是__blcok修饰的变量，block都是指针传递
    void(^block)(void) = ^ {
        NSLog(@"%d", a);
    };
    
    a = 5;
    block();
}


@end
