//
//  ViewController.m
//  01-转盘
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"
#import "WheelView.h"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, weak) WheelView *wheelV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WheelView *wheelV = [WheelView wheelView];
    wheelV.center = self.view.center;
    [self.view addSubview:wheelV];
    self.wheelV = wheelV;
    
//    WheelView *wheelV = [[WheelView alloc] init];
//    wheelV.center = self.view.center;
//    self.wheelV = wheelV;
//    [self.view addSubview:wheelV];
}

- (IBAction)rotation:(id)sender {
    [self.wheelV rotation];
}
- (IBAction)stop:(id)sender {
    [self.wheelV stop]; 
}

@end
