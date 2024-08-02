//
//  ViewController.m
//  08-super,superClass,class
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
#import "SubPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SubPerson *sp = [[SubPerson alloc] init];
    
    [sp test];
}


@end
