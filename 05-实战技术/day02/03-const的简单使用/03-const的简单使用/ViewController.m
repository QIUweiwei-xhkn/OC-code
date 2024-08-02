//
//  ViewController.m
//  03-const的简单使用
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

/*
     const作用：
     1.修饰右边基本变量或者指针变量 int a int *p
     2.被const修饰变量只读
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.修饰基本变量
//    int const a = 6;
//    const int a = 6;
//    a = 10; // 报错 Cannot assign to variable 'a' with const-qualified type 'const int'
  
    // 2.修饰指针变量
//    int a = 3;
//    int b = 5;
////    int const *p = &a; // p是变量， *p是只读变量
////    a = 5;
////    *p = 5; // 报错 Read-only variable is not assignable
//    
//    int * const p = &a; // *p是变量， p是只读变量
//    p = &b; // 报错 Cannot assign to variable 'p' with const-qualified type 'int *const'
    
    // 面试题
    int * const p;  // p：只读 *p：变量
    int const * p1; // p1：变量 *p1：只读
    const int *p2;  // p2：变量 *p2：只读
    const int * const p3; // р3: *р3:都是只读
    int const * const p4; // p4: *p4:都是只读
}


@end
