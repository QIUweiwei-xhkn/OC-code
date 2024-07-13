//
//  ViewController.m
//  05-倒影
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@", self.view.layer);
    CAReplicatorLayer *repLayer = (CAReplicatorLayer *)self.view.layer;
    repLayer.instanceCount = 2;
    repLayer.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    // 阴影
    repLayer.instanceRedOffset -= 0.3;
    repLayer.instanceGreenOffset -= 0.3;
    repLayer.instanceBlueOffset -= 0.3;
    repLayer.instanceAlphaOffset -= 0.1;
    
}


@end
