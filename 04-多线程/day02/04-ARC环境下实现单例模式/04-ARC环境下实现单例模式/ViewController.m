//
//  ViewController.m
//  04-ARC环境下实现单例模式
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"
#import "QTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    QTool *t1 = [[QTool alloc] init];
//    [t1 release];
    QTool *t2 = [[QTool alloc] init];
    QTool *t3 = [QTool new];
    
    QTool *t4 = [QTool shareTool];
    
    QTool *t5 = [t3 copy];
    QTool *t6 = [t3 mutableCopy];
    
    // 系统单例模式的例子
    [UIApplication sharedApplication];
    [NSFileManager defaultManager];
    
    
    
    NSLog(@"t1--%p, t2---%p, t3---%p, t4---%p, t5---%p, t6---%p", t1, t2, t3, t4, t5, t6);
    
}
@end
