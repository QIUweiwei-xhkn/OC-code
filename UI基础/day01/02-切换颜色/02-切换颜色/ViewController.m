//
//  ViewController.m
//  02-切换颜色
//
//  Created by wei wei on 2023/12/17.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, weak)IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 点击红色按钮
-(IBAction)selector:(id)senderclickRedButton {
    // 改变文字颜色
    self.label.textColor = [UIColor redColor];
    // 改变文本内容
    self.label.text = @"我变红了";
    // 改变背景颜色
    self.label.backgroundColor = [UIColor blueColor];
    // 文字居中
    self.label.textAlignment = NSTextAlignmentCenter;
    //改变文字大小
    self.label.font = [UIFont systemFontOfSize:20.0f];
}

#pragma mark - 点击蓝色按钮
-(IBAction)clickBlueButton {
    self.label.textColor = [UIColor blueColor];
    self.label.text = @"我变蓝了";
    self.label.backgroundColor = [UIColor greenColor];
    self.label.font = [UIFont systemFontOfSize:30.0f];
}

#pragma mark - 点击绿色按钮
-(IBAction)clickGrrenButton {
    self.label.textColor = [UIColor greenColor];
    self.label.text = @"我变绿了";
    self.label.backgroundColor = [UIColor redColor];
    self.label.font = [UIFont systemFontOfSize:40.0f];
}

@end
