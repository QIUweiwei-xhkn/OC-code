//
//  ViewController.m
//  02-CATransform3D
//
//  Created by wei wei on 2024/7/11.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 3D效果
//    self.imageV.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    [UIView animateWithDuration:0.5 animations:^{
        // 把结构体转成对象
        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
        // 通过KVC一般是做快速旋转，平移，缩放
//        [self.imageV.layer setValue:value  forKeyPath:@"transform"];
//        [self.imageV.layer setValue:@(M_PI)  forKeyPath:@"transform.rotation.x"];
        [self.imageV.layer setValue:@(1.2) forKeyPath:@"transform.scale"];
    }];
}
@end
