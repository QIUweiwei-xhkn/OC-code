//
//  ViewController.m
//  05-weak和assign的区别
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"

/*
     面试：解释weak,assgin，什么时候使用Weak和assign
     ARC: 才有weak
     weak：—weak 弱指针，不会让引用计数器+1，如果指向对象被销毁，指针会自动清空
     assgin：__unsafe_unretained修饰，不会让引用计数器+1，如果指向对象被销毁，指针不会清空
 */

@interface ViewController ()
//@property(nonatomic, weak) UIView *redView;   // __weak

@property(nonatomic, assign) UIView *redView;   // __unsafe_unretained
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
    _redView = redView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _redView.frame = CGRectMake(100, 100, 200, 200);
}
@end
