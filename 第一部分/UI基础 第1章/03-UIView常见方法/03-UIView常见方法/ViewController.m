//
//  ViewController.m
//  03-UIView常见方法
//
//  Created by wei wei on 2023/9/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建开光添加到控制器的View中
    //  1. addSubview 添加子控件
    // 创建一个开关对象
//    UISwitch *s = [[UISwitch alloc] init];
//    [self.view addSubview:s];
    // 2. addSubview 会将右（s）控件添加到左边（view）控件中
//    UISegmentedControl *sg = [[UISegmentedControl alloc] initWithItems:@[@"123",@"456",@"789"]];
//    [self.view addSubview:sg];
    
    
}

// 3. removeFromSuperview 把方法的调用者从父控件中移除
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.redView removeFromSuperview];
    //  4.viewWithTag 获得redView 找子控件（不建议）
    UIView *view = [self.view viewWithTag:15];
    [view removeFromSuperview];
}

//4.viewWithTag 区分
- (IBAction)buttonClick:(UIButton *)btn {
//    NSLog(@"buttonClick-%p",btn);
    if(btn.tag == 20)
        NSLog(@"点击了左边的按钮");
    else if(btn.tag == 30)
        NSLog(@"点击了中间的按钮");
    else if(btn.tag == 40)
        NSLog(@"点击了右边的按钮");
}
@end
