//
//  ViewController.m
//  02-UIButton在代码中的使用和UIButton监听点击
//
//  Created by wei wei on 2024/1/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  1.1 创建按钮对象
//    UIButton *button = [[UIButton alloc] init]; 更换创建方式
    // 注意：只能在按钮初始化的时候给按钮设置类型
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 1.2 设置按钮类型
//    button.buttonType = UIButtonTypeDetailDisclosure; // 报错 Assignment to readonly property
    
    // 1.3 设置frame
    button.frame = CGRectMake(100, 100, 170, 60);
    
    // 1.4 设置背景颜色
    button.backgroundColor = [UIColor redColor];
    
    // 1.5 设置文字
    // 分状态：
//    button.titleLabel.text = @"普通文字";
    [button setTitle:@"普通文字" forState:UIControlStateNormal];
    [button setTitle:@"高亮文字" forState:UIControlStateHighlighted];
    
    // 1.6 设置文字颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    // 1.7 设置文字阴影颜色
    [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    button.titleLabel.shadowOffset = CGSizeMake(3, 2);
    
    // 1.8 设置内容图片
//    [button setImage:[UIImage imageNamed:@"1"] forState:UIControlStateHighlighted];
//    button.imageView.backgroundColor = [UIColor purpleColor];
    
    // 1.9 设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    // 2.0 加到控制器的view中
    [self.view addSubview:button];
    
    // 监听按钮点击 非常重要
    /*
     Target: 目标（让谁做事情）
     action: 方法（做什么事情）
     Events: 事件
     */
//    SEL sel = @selector(clickButton:);
    [button addTarget:self action:@selector(demo) forControlEvents:UIControlEventTouchUpInside];
}

-(void)demo {
    NSLog(@"%s",__func__);
}

- (IBAction)clickButton:(UIButton *)button {
    button.enabled = NO;
}

@end
