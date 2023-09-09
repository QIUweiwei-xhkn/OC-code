//
//  ViewController.m
//  04-UIView的位置和尺寸
//
//  Created by wei wei on 2023/9/6.
//

#import "ViewController.h"

@interface ViewController ()
//@property(nonatomic) CGRect frame;
// 控件矩形框在父控件中的位置和尺寸（以父控件的左上角为坐标原点）

//@property(nonatomic) CGRect bounds;
// 控件矩形框的位置和尺寸（以自己的左上角为坐标原点，so bounds的x，y一般为零）

//@property(nonatomic) CGPoint center;
// 控件矩形框中点位置（以父控件的左上角为坐标原点）

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个红色的View添加到控制器的View中
    UIView *redView = [[UIView alloc] init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
//    NSLog(@"1");
    redView.frame = CGRectMake(100, 100, 100, 100);
//    redView.bounds = CGRectMake(0, 0, 200, 200);
    redView.center = CGPointMake(0, 0);
}


@end
