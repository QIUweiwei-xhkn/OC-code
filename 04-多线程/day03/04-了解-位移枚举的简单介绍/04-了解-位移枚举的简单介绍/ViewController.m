//
//  ViewController.m
//  04-了解-位移枚举的简单介绍
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"

// 第一种写法
typedef enum : NSUInteger {
    QDemoTypeTop,
    QDemoTypeBottom
} QDemoType;

// 第二种写法,定 类型
typedef NS_ENUM(NSUInteger, QType) {
    QTypeTop,
    QTypeBottom
};

// 第三种枚举, 位移枚举
// 可以传多个值
// 如果是位移枚举，观察第一个枚举值，如果该枚举值！=② 那么可以默认传0做参数，如果传0做參数，那么效率最高 
typedef NS_OPTIONS(NSUInteger, QActionType) {
    QActionTypeTop = 1 << 0,  // 1
    QActionTypeBottom = 1 << 1, // 2
    QActionTypeRight = 1 << 2,  // 4
    QActionTypeLeft = 1 << 3    // 8
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo:QActionTypeRight | QActionTypeLeft | QActionTypeTop | QActionTypeBottom];
}

//按位与 & 1&1==1 160==0 0&0==0 只要有0则为0
//按位或 | 1/1==1 1|0==1 0|0==0 只要有1则为1
-(void)demo:(QActionType)type {
    NSLog(@"%zd", type);
    if(type & QActionTypeTop) {
        NSLog(@"向上---%zd", QActionTypeTop);
    }
    if(type & QActionTypeBottom) {
        NSLog(@"向下---%zd", QActionTypeBottom);
    }
    if(type & QActionTypeRight) {
        NSLog(@"向右---%zd", QActionTypeRight);
    }
    if(type & QActionTypeLeft) {
        NSLog(@"向左---%zd", QActionTypeLeft);
    }
    
}

@end
