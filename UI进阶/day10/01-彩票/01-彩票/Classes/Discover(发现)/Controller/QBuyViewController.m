//
//  QBuyViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import "QBuyViewController.h"
#import "QBuyTitleBtn.h"

@interface QBuyViewController ()
/** <#注释#>   */
@property(nonatomic, weak) UIButton *btn;
@end

@implementation QBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[QBuyTitleBtn alloc] init];
    [btn setImage:[UIImage imageNamed:@"yellowDownArrow"] forState:UIControlStateNormal];
    [btn setTitle:@"全部采买" forState:UIControlStateNormal];
    [btn sizeToFit];
    self.btn = btn;
    self.navigationItem.titleView = btn;
    
    // 设置左侧返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]  initWithImage:[UIImage imageWithRenderOriginalName:@"navBack"] style:0 target:self action:@selector(back)];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
////    [self.btn setTitle:@"全部采买全部采买全部采买全部采买全部采买" forState:UIControlStateNormal];
////    [self.btn sizeToFit];
//    
//    [self.btn setImage:nil forState:UIControlStateNormal];
//}

@end
