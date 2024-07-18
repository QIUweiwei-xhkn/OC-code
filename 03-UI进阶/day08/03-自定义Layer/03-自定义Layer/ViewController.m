//
//  ViewController.m
//  03-自定义Layer
//
//  Created by wei wei on 2024/7/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     通过CALayer，就能做出跟UIImageView一样的界面效果
     对比CALayer，UIView多了一个事件处理的功能。及 CALayer不能处理用户的触摸事件，而UIView可以
     所以，如果显示出来的东西需要跟用户进行交互的话，用UIView；如果不需要跟用户进行交互，用UIView或者CALayer都可以
    CALayer的性能会高一些，因为它少了事件处理的功能，更加轻量级
     */
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"1"].CGImage;
}


@end
