//
//  ViewController.m
//  01-改变字体颜色
//
//  Created by wei wei on 2023/9/4.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak)IBOutlet UILabel *lable;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//控制器 凡是继承UIViewController的对象都是控制器
// 作用：用来管理软件界面，处理软件界面的交互事件
// 特点：一个控制器专门管理属于自己的软件界面
//#pragma mark - “红色点击”
- (IBAction) redclick {
    self.lable.textColor = [UIColor redColor];
    self.lable.backgroundColor = [UIColor purpleColor];
    self.lable.font = [UIFont systemFontOfSize:24];
    NSLog(@"redclick");
}

//#pragma mark - 绿色点击
- (IBAction) greenclick {
    self.lable.textColor = [UIColor greenColor];
    NSLog(@"greenclick");
}

//#pragma mark - 蓝色点击
- (IBAction) blueclick {
    self.lable.textColor = [UIColor blueColor];
    NSLog(@"blueclick");
}
@end
