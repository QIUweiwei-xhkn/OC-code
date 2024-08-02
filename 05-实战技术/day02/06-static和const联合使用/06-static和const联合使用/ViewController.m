//
//  ViewController.m
//  06-static和const联合使用
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
// statiC和const联合使用
// const修饰全局变量
// static修饰全局变量，修改作用域

static NSString * const name = @"name"; // 在当前文件内才可以使用的只读变量name
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults] setValue:@"123" forKey:name];
    // Do any additional setup after loading the view.
}


@end
