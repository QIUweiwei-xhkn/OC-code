//
//  ViewController.m
//  07-Runtime（字典转模型KVC实现）
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
#import "NSDictionary+property.h"
#import "StatusItem.h"
#import "NSObject+model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.获得文件的全路径
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    // 2.通过文件路径获得字典
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:fullPath];
    
    // 设计模型 ，创建属性代码==》dict
//    [dict[@"user"] creatProtertyCode];
    // 3.字典转模型
    StatusItem *item = [StatusItem modelWithDict:dict];
    
//    NSLog(@"%@", item);
}


@end
