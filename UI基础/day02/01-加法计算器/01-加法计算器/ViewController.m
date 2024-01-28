//
//  ViewController.m
//  01-加法计算器
//
//  Created by wei wei on 2023/12/30.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NumberTextFile1;
@property (weak, nonatomic) IBOutlet UITextField *NumberTextFile2;
@property (weak, nonatomic) IBOutlet UILabel *Result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)sum {
    NSString *num1String = self.NumberTextFile1.text;
    NSString *num2String = self.NumberTextFile2.text;
    
    if(num1String.length == 0) {
//        UIAlertView *alertiew = [[UIAlertView alloc] initWithTitle:@"输入有误" message:@"请输入第一个数" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
//        [alertiew show];
        [self showInfo:@"请输入第一个数"];
        return;
    }
    if(num1String.length == 0) {
//        UIAlertView *alertiew = [[UIAlertView alloc] initWithTitle:@"输入有误" message:@"请输入第二个数" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
//        [alertiew show];
        [self showInfo:@"请输入第二个数"];
        return;
    }
    
    NSInteger num1 = [num1String integerValue];
    NSInteger num2 = [num2String integerValue];
    
    NSInteger sum = num1 + num2;
    
    self.Result.text = [NSString stringWithFormat:@"%zd", sum];
}
-(void)showInfo:(NSString *)info {
    UIAlertView *alertiew = [[UIAlertView alloc] initWithTitle:@"输入有误" message:info delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alertiew show];
}


@end
