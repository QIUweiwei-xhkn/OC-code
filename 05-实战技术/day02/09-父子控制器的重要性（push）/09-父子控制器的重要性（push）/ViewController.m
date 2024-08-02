//
//  ViewController.m
//  09-父子控制器的重要性（push）
//
//  Created by wei wei on 2024/8/2.
//

#import "ViewController.h"
#import "ChildViewController.h"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, strong) ChildViewController *childVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加一个子控制器
    ChildViewController *childVC = [[ChildViewController alloc] init];
    childVC.view.backgroundColor = [UIColor greenColor];
    childVC.view.frame = CGRectMake(100, 200, 200, 200);
//    _childVC = childVC;
    [self.view addSubview:childVC.view];
    
    [self addChildViewController:childVC];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
//    [self.navigationController pushViewController:vc animated:YES];
//}
@end
