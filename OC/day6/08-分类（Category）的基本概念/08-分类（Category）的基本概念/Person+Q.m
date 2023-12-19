//
//  Person+Q.m
//  08-分类（Category）的基本概念
//
//  Created by wei wei on 2023/10/28.
//

#import "Person+Q.h"

@implementation Person (Q)
// 实现扩充方法
-(void)playFootball {
    NSLog(@"%s",__func__);
}
-(void)playBasketball {
    NSLog(@"%s",__func__);
}
@end
