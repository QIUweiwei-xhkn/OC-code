//
//  ViewController.m
//  07-UIView的常见属性（尺寸和位置）
//
//  Created by wei wei on 2023/12/19.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, weak)UILabel *lable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个UIlable对象
    UILabel *lable1 = [[UILabel alloc] init];
    //设置frame(设置位置和尺寸)
    lable1.frame = CGRectMake(100, 100, 200, 100);
    //设置背景颜色
    lable1.backgroundColor = [UIColor redColor];
    //添加到控制器中
    [self.view addSubview:lable1];
    self.lable = lable1;
}

- (IBAction)bound {
    // 改变尺寸(x,y 无论为多少 事实上都为零） 中心不变向四周延伸
    self.lable.bounds = CGRectMake(0, 0, 240, 120);
}
- (IBAction)center {
    // 改变位置 以父控件左上角为坐标原点，相对于自身的中心点
    //显示在最中间
    self.lable.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
}

- (IBAction)changeFrame {
    //方式1
//    self.lable.frame = CGRectMake(200, 100, 200, 100);
    // 方式2
    //结构体是值传递,不是地址传递
    CGRect frame = self.lable.frame;
    frame.origin.x += 100;//改变x
    frame.origin.y += 100;//改变y
    
    frame.size.width -= 50; //改变宽度
    frame.size.height -= 50;//改变高度
    self.lable.frame = frame;
}

@end
