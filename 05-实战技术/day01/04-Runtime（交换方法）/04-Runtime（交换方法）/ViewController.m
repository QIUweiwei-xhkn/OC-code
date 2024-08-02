//
//  ViewController.m
//  04-Runtime（交换方法）
//
//  Created by wei wei on 2024/7/31.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

/*
     Runtime（交换方法）：只想要修改系统方法的实现
     需求：
     比如说有一个项目，已经开发了2年，忽然项目负责人添加一个功能，每次UIImage加载图片，告诉我是否加载成功
     // 给系统的imageNamed添加功能，只能使用runtime（交互方法）
     // 交互方法实现步骤 1.给系统的方法添加分类
     //               2.自己实现一个带有扩展功能的方法 
     //               3.交换方法
 
    // 1.自定义UIImage
         弊端：
         1.每次使用，都需要导入
         2.项目大了，没办法实现
    // 2.UIImage添加分类 会覆盖系统的imageNamed方法，不建议使用
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"1 "];
    
}


@end
