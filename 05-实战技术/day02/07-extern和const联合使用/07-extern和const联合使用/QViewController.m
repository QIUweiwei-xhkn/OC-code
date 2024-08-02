//
//  QViewController.m
//  07-extern和const联合使用
//
//  Created by wei wei on 2024/8/1.
//

#import "QViewController.h"
#import "GlobeConst.h"

//NSString * const name = @"name";
@interface QViewController ()

@end

@implementation QViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSUserDefaults standardUserDefaults] setValue:@"333" forKey:home_name];
}



@end
