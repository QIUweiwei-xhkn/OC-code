//
//  ViewController.m
//  05-UIButton调整内部的子控件的位置
//
//  Created by wei wei on 2024/2/5.
//

#import "ViewController.h"
#import "QButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.1 创建一个按钮
    QButton *button = [QButton buttonWithType:UIButtonTypeCustom];
    
    // 1.2 设置frame
    button.frame = CGRectMake(100, 100, 200, 70);
    
    // 1.3 设置背景颜色
    button.backgroundColor = [UIColor greenColor];
    
    // 1.4 设置文字
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    
    // 1.5 设置内容图片
    [button setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    // 1.6 改变位置
    button.titleLabel.backgroundColor = [UIColor redColor];
    
    // 注意：在按钮外部改变的尺寸，按钮内部都会被覆盖
    /*
     button.titleLabel.frame = CGRectMake(0, 0, 100, 70);
     button.imageView.frame = CGRectMake(100, 0, 100, 70);
     */
    
    
    
    [self.view addSubview:button];
}


@end
