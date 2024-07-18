//
//  ViewController.m
//  06-UIview的常见方法
//
//  Created by wei wei on 2023/12/19.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIView *redView;
@property(nonatomic, weak)UIView *redview;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //根据tag拿到对应的View
    UIView *redView = [self.view viewWithTag:1];
    self.redview = redView;
    
    // 1.1创建UISwitch对象
    UISwitch *sw = [[UISwitch alloc] init];
    
    // 1.2加到控制器的view中
    [self.view addSubview:sw];
    
    // 1.3创建UISwitch对象
    UISwitch *sw1 = [[UISwitch alloc] init];
    
    //1.4加到红色的view中
    [redView addSubview:sw1];
    
    //1.5创建一个选项卡对象
    UISegmentedControl *sg = [[UISegmentedControl alloc] initWithItems:@[@"哈哈", @"呵呵", @"😄"]];
    
    //1.6加到红色的view中
    [redView addSubview:sg];
    
    // 1.7移除
//    [sg removeFromSuperview];
//    [self.redView removeFromSuperview];
//    [sw removeFromSuperview];
    
//    [self.view removeFromSuperview];
}
- (IBAction)remove {
    [self.redview removeFromSuperview];
}

// 只要控件有父控件就一定能移除
//-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self.view removeFromSuperview];
//}

- (IBAction)clickbtn:(UIButton *)button {
    //做私人的事
//    if(button == self.btn1)
//        NSLog(@"点击了按钮1");
//    else if(button == self.btn2)
//        NSLog(@"点击了按钮2");
//    else if(button == self.btn3)
//        NSLog(@"点击了按钮3");
    switch (button.tag) {
        case 3:
            NSLog(@"点击了按钮1");
            break;
        case 4:
            NSLog(@"点击了按钮2");
            break;
        case 5:
            NSLog(@"点击了按钮3");
            break;
        default:
            break;
    }
    //做公共的事
    NSLog(@"做了公共的事");
}

@end
