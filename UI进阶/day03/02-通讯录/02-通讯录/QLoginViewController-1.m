//
//  QLoginViewController-1.m
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import "QLoginViewController-1.h"
#import "QContactViewController-2.h"

@interface QLoginViewController_1 ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation QLoginViewController_1

// 记住密码开关发生改变
- (IBAction)remPwdChange:(id)sender {
    if(self.remPwdSwitch.on == NO)
//        self.autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
}
// 自动登入开关发生改变
- (IBAction)autoLoginChange:(id)sender {
    if(self.autoLoginSwitch.on == YES)
        [self.remPwdSwitch setOn:YES animated:YES];
}
- (IBAction)LoginBtnClick:(id)sender {
     // 如果用户名和密码正确，跳转到下一个界面
    if([self.accountTextF.text isEqualToString:@"123"] && [self.pwdTextF.text isEqualToString:@"123"]) {
        // 跳转到下一个界面
        // 手动执行线（segue）
        [self performSegueWithIdentifier:@"ContactVC" sender:nil];
    }else { // 提醒用户， 密码和账号至少一个不对
        NSLog(@"密码和账号至少一个不对");
    }
    
    /**
     *  performSegueWithIdentifier底层实现
     *      1.到StoryBaord中查找有没有给定标识的segue
     *      2.根据指定标识的segue，创建一个UIStoryBoardSegue对象之后，把当前控制器给他的源控制器赋值
     *      3.该UIStoryBoardSegue对象创建他的目标控制器，再给UIStoryBoardSegue对象创建的目标控制器赋值
     *      4.调用当前控制器的prepareForSegue方法，告诉用户当前的线已经准备好了
     *      4.[segue perform];
     *      [segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:YES];
     */
}

// 准备跳转前调用
// 准备一些传递数据（顺序传序）
//  1.数据接收的控制器定义一个属性，用来接收数据
//  2.数据来源控制器要拿到接收数据的控制器
//  3.给接收数据的控制器的接收数据的属性赋值

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 要跳转的控制器
    NSLog(@"%@",segue.destinationViewController);
    // 源控制器
    NSLog(@"%@",segue.sourceViewController);
    
    QContactViewController_2 *contact = (QContactViewController_2 *)segue.destinationViewController;
    contact.AccountName = self.accountTextF.text;
    
//    [segue perform];
//    [segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 监听账号密码都有值的时候，让登入按钮能点击
    // 方法1 代理
//    self.accountTextF.delegate = self;
//    self.pwdTextF.delegate = self;
    
    // 方法二 通知
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    // 手动判断账号密码都有值的
    [self textChange];
}

// 当文本框内容发生改变时
- (void)textChange {
//    if(self.accountTextF.text.length && self.pwdTextF.text.length) {
//        self.loginBtn.enabled = YES;
//    }else
//        self.loginBtn.enabled = NO;
    self.loginBtn.enabled = self.accountTextF.text.length && self.pwdTextF.text.length;
}
// 由延迟，当该方法判断完才会给文本框的Text属性赋值，代理不适用
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if(self.accountTextF.text.length && self.pwdTextF.text.length) {
//        self.loginBtn.enabled = YES;
//    }else
//        self.loginBtn.enabled = NO;
//    NSLog(@"%@", string);
//    NSLog(@"----%@", self.pwdTextF.text);
//    return YES;
//}

@end
