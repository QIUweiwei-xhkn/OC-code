//
//  ViewController.m
//  01-xib的基本使用(车模型的定义)
//
//  Created by wei wei on 2024/2/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示xib
    // 方法一：
    /*
     UIView *carView = [[[NSBundle mainBundle] loadNibNamed:@"CarView" owner:nil options:nil] firstObject];
     carView.frame = CGRectMake(0, 100, 393, 168);
     [self.view addSubview:carView];
     */

    
    // 方法二:
    UINib *nib = [UINib nibWithNibName:@"CarView" bundle:nil];
    UIView *carView = [[nib instantiateWithOwner:nil options:nil] lastObject];
    [self.view addSubview:carView];
}


@end
