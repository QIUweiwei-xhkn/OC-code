//
//  ViewController.m
//  05-Runtime（动态添加方法）
//
//  Created by wei wei on 2024/7/31.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

/*
    Runtime（动态添加方法）：OC都是懒加载机制，只要一个方法实现了，就会马上添加到方法列表中，
        app：免费版，收费版
        QQ，微博，直播等等应用，都有会员机制
    美团有个面试题？有没有使用过performSelector，什么时候使用？动态添加方法的时候使用过？怎么动态添加方法？用runtime？为什么要动态添加方法？
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _cmd:当前方法编号
//    NSLog(@"%@", NSStringFromSelector (_cmd));
    
    Person *p = [[Person alloc] init];
    // 执行某个方法
//    [p performSelector:@selector(eat)];
    [p performSelector:@selector(run:) withObject:@20];
}


@end
