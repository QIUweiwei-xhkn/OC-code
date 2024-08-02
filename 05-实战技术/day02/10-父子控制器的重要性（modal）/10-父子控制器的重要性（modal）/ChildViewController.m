//
//  ChildViewController.m
//  10-父子控制器的重要性（modal）
//
//  Created by wei wei on 2024/8/2.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    // 判断当前方法调用者是否被modal，如果不是，判断父控制器是否被modal
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
