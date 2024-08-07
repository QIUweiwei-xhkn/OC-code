//
//  ViewController.m
//  05-block循环引用
//
//  Created by wei wei on 2024/8/6.
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
    modalVC.view.backgroundColor = [UIColor orangeColor];
    [self presentViewController:modalVC animated:YES completion:nil];
    NSLog(@"%@", self.presentedViewController);
}
@end
