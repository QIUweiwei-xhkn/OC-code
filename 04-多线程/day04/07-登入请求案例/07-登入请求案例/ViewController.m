//
//  ViewController.m
//  07-登入请求案例
//
//  Created by wei wei on 2024/7/23.
//

#import "ViewController.h"
#import "SVProgressHUD/SVProgressHUD.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;

@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation ViewController
- (IBAction)loginBtnClick:(id)sender {
    // 添加遮罩
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack )];
    
    // 0.拿到用户输入
    NSString *userName = self.userNameTF.text;
    NSString *pwd = self.pwdTF.text;
    
    if(userName.length == 0) {
        [SVProgressHUD showErrorWithStatus:self.userNameTF.placeholder];
    }
    if(pwd.length == 0) {
        [SVProgressHUD showErrorWithStatus:self.pwdTF.placeholder];
    }
    
    // 1.确定URL
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://120.25.226.186:32812/login?username=%@&pwd=%@&type=JON", userName, pwd]];
    // 2.创建请求对象（GET）
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
//    [SVProgressHUD show];
    [SVProgressHUD showWithStatus:@"请耐心等待，将要完成"];
    
    // 3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        if(connectionError) {
            NSLog(@"请求失败");
            return;
        }
        NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", res);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [SVProgressHUD dismiss];  
            [SVProgressHUD showSuccessWithStatus:res];
        });
    }];
    
}


@end
