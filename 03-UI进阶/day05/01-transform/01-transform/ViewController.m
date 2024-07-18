//
//  ViewController.m
//  01-transform
//
//  Created by wei wei on 2024/7/7.
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

// 平移
- (IBAction)moveUp:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 使用make，他是相对于原始位置发生的形变
//        self.imageV.transform = CGAffineTransformMakeTranslation(0, -100);
        // 相对上一次，去掉make
        self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, 0, -100);
    }];
}
- (IBAction)moveDown:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 使用make，他是相对于原始位置发生的形变
//        self.imageV.transform = CGAffineTransformMakeTranslation(0, 100);
        // 相对上一次，去掉make
        self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, 0, 100);
    }];
}
// 旋转（旋转的度数，是一个弧度）
- (IBAction)rorate:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.imageV.transform = CGAffineTransformMakeRotation(M_PI_4);
//        self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, M_PI_4);
    }];
}
// 缩放
- (IBAction)scale:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
//        self.imageV.transform = CGAffineTransformMakeScale(1.2, 1);
        self.imageV.transform = CGAffineTransformScale(self.imageV.transform, 1, 1.5);
    }];
}

@end
