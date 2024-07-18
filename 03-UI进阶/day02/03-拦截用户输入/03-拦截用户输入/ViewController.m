//
//  ViewController.m
//  03-拦截用户输入
//
//  Created by wei wei on 2024/5/10.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *countryText;
@property (weak, nonatomic) IBOutlet UITextField *birthDayText;
@property (weak, nonatomic) IBOutlet UITextField *cityText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryText.delegate = self;
    self.birthDayText.delegate = self;
    self.cityText.delegate = self;
}

#pragma mark -- UITextFieldDelegate
// 是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

// 开始编辑时调用 （成为第一响应者）
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
}

// 是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return NO;
}

// 结束编辑的时候调用
//- (void)textFieldDidEndEditing:(UITextField *)textField{}

// 能否修改文文本框内容(拦截用户输入)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return NO;
}
@end
