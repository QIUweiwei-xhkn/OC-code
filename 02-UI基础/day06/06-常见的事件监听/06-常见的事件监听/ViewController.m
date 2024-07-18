//
//  ViewController.m
//  06-常见的事件监听
//
//  Created by wei wei on 2024/2/12.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFlied;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 2.UIScrollView
    UIScrollView *scrollView = nil;
    scrollView.delegate = self;
    
    // 3.UISegmentedControl
//    UISegmentedControl *s = [[UISegmentedControl alloc] initWithItems:@[@"123", @"234", @"345",@"567"]];
//    s.selectedSegmentIndex = 1;
//    [s addTarget:self action:@selector(sClick:) forControlEvents:UIControlEventValueChanged];
//    s.center = CGPointMake(self.view.center.x, 200);
//    [self.view addSubview:s];
    
    // 4.
    self.textFlied.delegate = self;
    
//    [self.textFlied addTarget:self action:@selector(tfEditingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    
//    [self.textFlied addTarget:self action:@selector(tfEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
//    
//    [self.textFlied addTarget:self action:@selector(tfEditingChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)tfEditingDidBegin {
    NSLog(@"开始编辑");
}

- (void)tfEditingDidEnd {
    NSLog(@"结束编辑");
}

/**
 *  当 textField 文字改变就会调用这个方法
 *  @pragma string 用户输入的文字
 *  @return YES ：允许用户输入； NO：禁止用户输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"shouldChangeCharactersInRange--%@", string);
    if([string isEqualToString:@"1"]) {
        return NO;
    }
    return YES;
}

- (void)tfEditingChanged:(UITextField *)tf {
    NSLog(@"%@", tf.text);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 退出键盘
//    [self.textFlied endEditing:YES];
    
//    [self.textFlied resignFirstResponder];
    
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"开始编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"结束编辑");
}

- (void)btnClick:(UIButton *)button {
    
}

- (void)sClick:(UISegmentedControl *)s {
    NSLog(@"%ld",s.selectedSegmentIndex);
}
@end
