//
//  ViewController.m
//  01-Block的基本使用
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"

/*
    Block作用：用来保存一段代码
    1.Block的声明
    2.Block的定义
 
    3.Block的类型
    4.Block的调用
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.声明:返回值（^block变量名）（参数）    // 参数为空也要传一个void
    void(^block)(void);
    
    // 2.定义：三种方式 = ^(参数) {}
    // 2.1 block定义方式一
    void(^block1)(void) = ^() {
        NSLog(@"调用了block1");
    };
    // 2.2 block定义方式二
    // 如果没有参数，（）参数可以隐藏， 如果有参数，定义的时候必须写参数，并且要写出参数名
    void(^block2)(int) = ^(int a) {
        NSLog(@"调用了block2");
    };
    // 2.3 block定义方式三 block若有返回值，在定义时可以省略返回值（如下定义可为^{};  省略int)
    int(^block3)(void) = ^int{
        return 3;
    };
    
    // 3.类型 int(^)(NSString *）
    int(^block4)(NSString *) = ^(NSString *str) {
        return 4;
    };
    
    // 4.调用
    block1();
    
    // block的快捷方式 inlineBlock
//    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//        <#statements#>
//    };
}


@end
