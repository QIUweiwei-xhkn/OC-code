//
//  ViewController.m
//  06-modal
//
//  Created by wei wei on 2024/7/7.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()
///** <#注释#>   */
@property(nonatomic, strong) TwoViewController *Tvc;

@property(nonatomic, strong) ViewController *StrongPoint1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.StrongPoint1 = self;
    // Do any additional setup after loading the view.
}

// 所有控件都可以实现modal
- (IBAction)modal:(id)sender {
    TwoViewController *Tvc = [[TwoViewController alloc] init];
    self.Tvc = Tvc;
    NSLog(@"%@",self.presentedViewController);
    // 如果一个控制器被销毁，那么它的view的业务逻辑是没办法实现的
    // 控制器被销毁，控制器的view不一定销毁（只要有强指针引用，就不会销毁）
    [self presentViewController:Tvc animated:YES completion:^{
        NSLog(@"modal completion");
//        NSLog(@"%@",[UIApplication sharedApplication].keyWindow.rootViewController);
    }];
    
//    CGRect frame = Tvc.view.frame;
//    frame.origin.y = [UIScreen mainScreen].bounds.size.height;
//    Tvc.view.frame = frame;
//    CGRect frame2 = Tvc.view.frame;
//    frame2.origin.y = 20;
//    [[UIApplication sharedApplication].keyWindow addSubview:Tvc.view];
//    [UIView animateWithDuration:0.5 animations:^{
//        Tvc.view.frame = frame2;
//    }];
//    NSLog(@"%@",self.presentedViewController);
    
}

@end
