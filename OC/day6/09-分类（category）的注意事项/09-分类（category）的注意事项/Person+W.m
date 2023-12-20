//
//  Person+W.m
//  09-分类（category）的注意事项
//
//  Created by wei wei on 2023/10/28.
//

#import "Person+W.h"

// 如果多个分类中都有和原有类中同名的方法, 那么调用该方法的时候执行谁由编译器决定
// 会执行最后一个参与编译的分类中的方法
@implementation Person (W)
-(void)say {
    NSLog(@"%s",__func__);
}
@end
