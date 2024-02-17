//
//  ViewController.m
//  08-修改约束动画
//
//  Created by wei wei on 2024/2/17.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redViewW;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.redViewW.constant = 50;
    [UIView animateWithDuration:2.0 animations:^{
        // 强制刷新
        [self.view layoutIfNeeded];
    }];
}
@end
