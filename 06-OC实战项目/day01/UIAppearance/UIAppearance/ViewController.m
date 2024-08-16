//
//  ViewController.m
//  UIAppearance
//
//  Created by wei wei on 2024/8/9.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *s1;
@property (weak, nonatomic) IBOutlet UISwitch *s2;
@property (weak, nonatomic) IBOutlet UISwitch *s3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
     appearance：只能在控件显示之前设置，才有作用
     夜视模式
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    _s1.onTintColor = [UIColor redColor];
//    _s2.onTintColor = [UIColor redColor];
//    _s3.onTintColor = [UIColor redColor];
    
//    [_s1 removeFromSuperview];
//    [_s2 removeFromSuperview];
    [self.view removeFromSuperview];
    
    UISwitch *switchView = [UISwitch appearance];
    switchView.onTintColor = [UIColor redColor];
    
    
//    [self.view addSubview:_s1];
//    [self.view addSubview:_s2 ];
    [[UIApplication sharedApplication].keyWindow addSubview:self.view];
}
@end
