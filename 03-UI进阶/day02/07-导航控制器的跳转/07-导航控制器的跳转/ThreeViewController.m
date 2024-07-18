//
//  ThreeViewController.m
//  07-导航控制器的跳转
//
//  Created by wei wei on 2024/5/18.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController
// 返回上一级
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)popToVC:(id)sender {
    // 返回到的控制器必须是导航控制器的子控制器
    [self.navigationController popToViewController:self.navigationController.childViewControllers[1] animated:YES];
}
- (IBAction)backRootVC:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
