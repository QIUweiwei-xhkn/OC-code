//
//  ViewController.m
//  03-Block在开发中使用场景（传值）
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"
#import "ModalViewController.h"

//@interface ViewController () <ModalViewControllerDelegate>
//
//@end

@interface ViewController ()

@end

/*
     传值：1.只要能拿到对方就能传值
 
     顺传：给需要传值的对象，直接定义属性就能传值
     逆传：用代理，block，就是利用block去代替代理
 */

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    modalVC.view.backgroundColor = [UIColor redColor];
//    modalVC.delegate = self;
    modalVC.block = ^(NSString *value) {
        NSLog(@"%@", value);
    };
    
    // 跳转
    [self presentViewController:modalVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//#pragma mark - ModalViewControllerDelegate
//- (void)modalViewController:(ModalViewController *)modalVC sendValue:(NSString *)value {
//    NSLog(@"%@", value);
//}
@end
