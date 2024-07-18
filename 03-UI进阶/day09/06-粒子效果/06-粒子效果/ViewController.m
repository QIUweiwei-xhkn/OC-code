//
//  ViewController.m
//  06-粒子效果
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"
#import "VCView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet VCView *vcView;

@end

@implementation ViewController
- (IBAction)strat:(id)sender {
    [self.vcView start];
}
- (IBAction)reDraw:(id)sender {
    [self.vcView reDraw];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
