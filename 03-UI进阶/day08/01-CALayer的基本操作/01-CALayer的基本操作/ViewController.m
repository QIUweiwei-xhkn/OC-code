//
//  ViewController.m
//  01-CALayer的基本操作
//
//  Created by wei wei on 2024/7/11.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 设置阴影的颜色
    self.imageView.layer.shadowColor = [UIColor blueColor].CGColor;
    // 设置阴影的不透明度（0～1）
    self.imageView.layer.shadowOpacity = 1;
    // 设置阴影的偏移量
    self.imageView.layer.shadowOffset = CGSizeMake(20, 20);
    // 设置阴影的模糊半径
    self.imageView.layer.shadowRadius = 5;

    // 边框的宽度，往里面走的
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = [UIColor greenColor].CGColor;

    // 设置圆角
    self.imageView.layer.cornerRadius = 50;
    //把超过根层以外的东西都给裁剪掉（UIview自带的层，我们称它是根层）
    self.imageView.layer.masksToBounds = YES;

}

- (void)UIViewLayer {
    // 设置阴影的颜色
    self.redView.layer.shadowColor = [UIColor blueColor].CGColor;
    // 设置阴影的不透明度（0～1）
    self.redView.layer.shadowOpacity = 1;
    // 设置阴影的偏移量
    self.redView.layer.shadowOffset = CGSizeMake(-30, -30);
    // 设置阴影的模糊半径
    self.redView.layer.shadowRadius = 10;
    
    // 边框的宽度，往里面走的
    self.redView.layer.borderWidth = 30;
    self.redView.layer.borderColor = [UIColor greenColor].CGColor;
    
    // 设置圆角
    self.redView.layer.cornerRadius = 50;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
