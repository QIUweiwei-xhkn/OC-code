//
//  ModalViewController.m
//  10-父子控制器的重要性（modal）
//
//  Created by wei wei on 2024/8/2.
//

#import "ModalViewController.h"
#import "ChildViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ChildViewController *childVC = [[ChildViewController alloc] init];
    childVC.view.backgroundColor = [UIColor blueColor];
    childVC.view.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:childVC.view];
    [self addChildViewController:childVC];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
