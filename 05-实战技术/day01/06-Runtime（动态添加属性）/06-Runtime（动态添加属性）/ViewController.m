//
//  ViewController.m
//  06-Runtime（动态添加属性）
//
//  Created by wei wei on 2024/7/31.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+property.h"

// 动态添加属性：什么时候需要动态添加属性

// 开发场景
// 给系统的类添加属性的时候，可以使用runtime动态添加属性方法

// 本质：动态添加属性，就是让某个属性与对象产生关联

// 需求：让一个NSObject类 保存一个字将串

// runtime一般都是针对系统的类
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *obj = [[NSObject alloc] init];
    obj.name = @"123";
    NSLog(@"%@", obj.name);
    
    // 创建字符串对象
//    NSString *str = [NSString stringWithString:@"123"];
//    Person *person = [[Person alloc] init];
//    person.name = str;
}


@end
