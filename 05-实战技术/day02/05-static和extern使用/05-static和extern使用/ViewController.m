//
//  ViewController.m
//  05-static和extern使用
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
//static int i = 0;   // static修饰全局变量
int i = 10;
/*
 static:1.修饰局部变量，被static修饰局部变量，延长生命周期，跟整个应用程序有关
        * 被static修饰局部变量，只会分配一次内存
        * 被static修饰局部变量什么分配内存？程序一运行时就会给static修饰变量分配内存
        2.修饰全局变量，被static修饰全局变量，作用域会修改，只能在当前文件下使用
 
 extern：声明外部全局变量，注意：extern只能用于声明，不能用于定义
 extern工作原理：先会专当前文件下查找有没有对应全局变量，如果没有，才回去其他文件查找
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    static int i = 0; // static修饰局部变量
    i++;
    NSLog(@"%d", i);
}

@end
