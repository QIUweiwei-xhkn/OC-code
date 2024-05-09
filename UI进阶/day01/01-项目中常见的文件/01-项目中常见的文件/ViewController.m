//
//  ViewController.m
//  01-项目中常见的文件
//
//  Created by wei wei on 2024/4/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ScreenW;
    NSLog(@"%@", NSStringFromCGSize([UIScreen mainScreen].bounds.size));
}


@end
