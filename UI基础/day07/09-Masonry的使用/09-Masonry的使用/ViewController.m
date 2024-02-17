//
//  ViewController.m
//  09-Masonry的使用
//
//  Created by wei wei on 2024/2/17.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.红色的view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 2.添加约束
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(20);
//        make.left.equalTo(self.view.mas_left).offset(20);
//        make.right.equalTo(self.view.mas_right).offset(-20);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
//    }];
    
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(20);
//        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset(-20);
//        make.bottom.equalTo(self.view).offset(-20);
//    }];
    
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(20);
//        make.left.offset(20);
//        make.right.offset(-20);
//        make.bottom.offset(-20);
//    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(20);
        make.bottom.and.left.offset(-20);
    }];

    
    
}


@end
