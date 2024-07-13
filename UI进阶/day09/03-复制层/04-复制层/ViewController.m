//
//  ViewController.m
//  04-复制层
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 复制层
    CAReplicatorLayer *replayer = [CAReplicatorLayer layer];
    replayer.frame = self.contentV.bounds;
    replayer.backgroundColor = [UIColor redColor].CGColor;
    [self.contentV.layer addSublayer:replayer];
    
    /// 创建一个震动条
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 20, 30, 50);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [replayer addSublayer:layer];
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(20, 100, 30, 50);
    layer2.backgroundColor = [UIColor greenColor].CGColor;
    [replayer addSublayer:layer2];
    
    // 复制的份数，包括它自己
    replayer.instanceCount = 3;
    // 对复制出来的子层做一个偏移量，每一个都是相对上一个复制出来的子层
    replayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
}


@end
