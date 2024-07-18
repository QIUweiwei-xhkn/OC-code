//
//  ViewController.m
//  06-hitTest方法练习
//
//  Created by wei wei on 2024/7/8.
//

#import "ViewController.h"
#import "ClickBtn.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnClick:(ClickBtn *)sender {
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateHighlighted];
    sender.popBtn = btn;
    btn.frame = CGRectMake(100, -80, 100, 100);
    [sender addSubview:btn];
}


@end
