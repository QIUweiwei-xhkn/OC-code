//
//  ViewController.m
//  03-size和center
//
//  Created by wei wei on 2024/8/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redview = [[UIView alloc] init];
    redview.backgroundColor = [UIColor redColor];
    
    /*
     CGRect bounds = redview.bounds;
     bounds.size = CGSizeMake(200, 200);
     redview.bounds = bounds;
     */
    
//    redview.center = self.view.center;
//    redview.bounds = CGRectMake(0, 0, 200, 200);
    
    redview.center = self.view.center;
    
    CGRect frame = redview.frame;
    frame.size  = CGSizeMake(200, 200);
    redview.frame = frame;
//    redview.frame = CGRectMake(0, 0, 200, 200);
    
    // 如果size，从frame取出来 先设置size，再设置center， 否则达不到理想效果
    // 如果size，从bounds取出来，就不用考虑center和size区别
    
    [self.view addSubview:redview];
}


@end
