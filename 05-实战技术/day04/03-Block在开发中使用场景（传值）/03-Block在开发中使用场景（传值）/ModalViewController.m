//
//  ModalViewController.m
//  03-Block在开发中使用场景（传值）
//
//  Created by wei wei on 2024/8/6.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 传值给ViewController
//    if([_delegate respondsToSelector:@selector(modalViewController:sendValue:)]) {
//        [_delegate modalViewController:self sendValue:@"123"];
//    }
    
    if(_block) {
        _block(@"123");
    }
}
@end
