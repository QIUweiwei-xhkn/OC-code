//
//  ViewController.m
//  04-position和archorPoint
//
//  Created by wei wei on 2024/7/11.
//

#import "ViewController.h"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, weak) CALayer *layer;
@property (weak, nonatomic) IBOutlet UIView *redView;
@end

@implementation ViewController
/*
 • CALayer有2个非常重要的属性：position和anchorPoint
 • @property CGPoint position;
 > 用来设置CALayer在父层中的位置
 ＞ 以父层的左上角为原点（0，0）
 
 • @property CGPoint anchorPoint;
 >称为“定位点”、“锚点”
 >决定着CALayer身上的哪个点会在position属性所指的位置
 ＞ 以自己的左上角力原点（0,0）
 ＞它的x、y取值范围都是0~1，默认值为（0.5,0.5）
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
    // UiView的center和position一样
    NSLog(@"center---%@", NSStringFromCGPoint(self.redView.center));
    NSLog(@"position---%@", NSStringFromCGPoint(self.redView.layer.position));
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.layer.position = self.view.center;
//    self.layer.anchorPoint = CGPointMake(0, 0);
    self.redView.layer.position = CGPointMake(200, 200);
    NSLog(@"center---%@", NSStringFromCGPoint(self.redView.center));
    NSLog(@"position---%@", NSStringFromCGPoint(self.redView.layer.position));
}
@end
