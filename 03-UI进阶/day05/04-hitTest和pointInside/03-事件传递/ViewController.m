//
//  ViewController.m
//  03-事件传递
//
//  Created by wei wei on 2024/7/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//1.当一个控件如果它的父控件不能够接收事件，那么它里面子控件也是不能接收事件的
//2.当一个控件隐藏的时候，它里面的子控件也跟着隐藏
//3.当一个控件透明的时候，它里面的子控件也跟着透明

//UIView不接收触摸事件的三种情况
//1.不接收用户交互
//userInteractionEnabled = NO
//2.隐藏
//hidden = YES
//3.透明
//alpha = 0.0 ~ 0.01
//提示：UIImageView的userInteractionEnabled默认就是NO，因此UIImageView以及它的子控件默认是不能接收触摸事件的

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
