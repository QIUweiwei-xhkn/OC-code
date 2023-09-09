//
//  ViewController.m
//  02-UIview常见属性
//
//  Created by wei wei on 2023/9/5.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

// 当控制器加载完毕后自动调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // superview 获取自己的父控件
//    NSLog(@"%@",self.blueView.superview);
//    NSLog(@"%p",self.view);
    
    // subviews 获取所有的子控件
    NSLog(@"%@",self.view.subviews);
}


@end
