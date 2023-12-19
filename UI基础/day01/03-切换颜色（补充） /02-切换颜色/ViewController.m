//
//  ViewController.m
//  02-切换颜色
//
//  Created by wei wei on 2023/12/17.
//
/*
 判断一个对象是否能连线的方法：
 看该对象的类是否继承于UIControl
 */
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, weak)IBOutlet UILabel *label;
// 属性2（没必要）
//@property(nonatomic, weak)IBOutlet UILabel *testLable;

// 红色按钮
@property(nonatomic, weak)IBOutlet UIButton *redbutton;


// 经典错误
/*
 问题描述
 '[<ViewController 0x101c06ca0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key testLable.'
 1.有多余的连线。 解决方法：删除多余的连线
 
 问题描述
 .'-[ViewController clickbtn:]: unrecognized selector sent to instance 0x106a07690'
 2找不到对应的方法 解决方法：1.添加对应的方法 2.删除多余的连线
 */
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
    
    // 改变按钮背景颜色
    self.redbutton.backgroundColor= [UIColor greenColor];
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

//- (IBAction)clickbtn:(UIButton *)sender {
//    NSLog(@"%s",__func__);
//}
@end
