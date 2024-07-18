//
//  ViewController.m
//  07-UIButton的内边距设置
//
//  Created by wei wei on 2024/2/5.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置按钮内边距
    // 1.设置内容
//    self.button.contentEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    
    // 2.设置图片
    self.button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
}


@end
