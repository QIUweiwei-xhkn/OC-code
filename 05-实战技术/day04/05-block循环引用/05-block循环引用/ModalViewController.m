//
//  ModalViewController.m
//  05-block循环引用
//
//  Created by wei wei on 2024/8/6.
//

#import "ModalViewController.h"

@interface ModalViewController ()
/** <#注释#>   */
@property(nonatomic, strong) void(^block)(void);
@end

@implementation ModalViewController
- (void)dealloc
{
    NSLog(@"modal已销毁");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // block造成循环利用：Block会对里面所有强指针变量都强引用一次
    __weak typeof(self) weakSelf = self;
    _block= ^ {
//        NSLog(@"%@", weakSelf);
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", strongSelf);
        });
    };
    
    _block();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
