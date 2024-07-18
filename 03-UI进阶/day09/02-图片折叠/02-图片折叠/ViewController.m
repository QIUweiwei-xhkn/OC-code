//
//  ViewController.m
//  02-图片折叠
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topInageV;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageV;
/** <#注释#>   */
@property(nonatomic, weak) CAGradientLayer *gdtlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 只让上面的图片显示上部
    self.topInageV.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    // 只让下面的图片显示下部
    self.bottomImageV.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    
    self.topInageV.layer.anchorPoint = CGPointMake(0.5, 1);
    
    self.bottomImageV.layer.anchorPoint = CGPointMake(0.5, 0);
    
    // 设置渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bottomImageV.bounds;
    // 设置渐变颜色
    gradientLayer.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
    
    //设置渐变的不透明度
    gradientLayer.opacity = 0;
    self.gdtlayer = gradientLayer;
   
    [self.bottomImageV.layer addSublayer:gradientLayer];
}

- (void)gradientLayer {
    // 设置渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bottomImageV.bounds ;
    // 设置渐变颜色
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor];
    // 设置渐变方向
    gradientLayer.startPoint = CGPointZero;
    gradientLayer.endPoint = CGPointMake(1, 0);
    // 设置一个渐变到下一个渐变的位置
    gradientLayer.locations = @[@0.3, @0.5];
    
    [self.bottomImageV.layer addSublayer:gradientLayer];
}

- (IBAction)pan:(UIPanGestureRecognizer *)pan {
    CGPoint  transP = [pan translationInView:pan.view];
    // 让上部图片开始旋转
    CGFloat angle = transP.y * M_PI / 200.0;
    
    // 近大远小
    CATransform3D transform = CATransform3DIdentity;
    // 300.0表示的的眼睛到图片的距离
    transform.m34 = -1 / 300.0;
    
    self.gdtlayer.opacity = transP.y / 200.0;
    
    self.topInageV.layer.transform = CATransform3DRotate(transform, -angle, 1, 0, 0);
//    self.topInageV.layer.transform = CATransform3DMakeRotation(-angle, 1, 0, 0);
    
    if(pan.state == UIGestureRecognizerStateEnded) {
        // 上部图片复位
        // usingSpringWithDamping：弹性系数，越小弹性越大
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.topInageV.layer.transform = CATransform3DIdentity;
            self.gdtlayer.opacity = 0;
        } completion:nil];
        
    }
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [UIView animateWithDuration:0.5 animations:^{
//        self.topInageV.layer.transform =  self.topInageV.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
//    }];
//}
@end
