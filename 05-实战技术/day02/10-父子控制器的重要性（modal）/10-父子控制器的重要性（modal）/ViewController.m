//
//  ViewController.m
//  10-父子控制器的重要性（modal）
//
//  Created by wei wei on 2024/8/2.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    modalVC.view.backgroundColor = [UIColor redColor];
    [self presentViewController:modalVC animated:YES completion:nil];
}
@end
