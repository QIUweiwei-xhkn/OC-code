//
//  Person+Q.m
//  09-分类（category）的注意事项
//
//  Created by wei wei on 2023/10/28.
//

#import "Person+Q.h"


@implementation Person (Q)
-(void)hello {
    // 3.可以在分类中访问原有类中.h中的属性
    NSLog(@"hello %f", _weigth);
}

// 注意: 如果分类中有和原有类同名的方法, 会调用分类中的方法
// 也就是说会忽略原有类的方法
// 注意: 在开发中尽量不要这样写
-(void)say
{
    NSLog(@"%s",__func__);
}
@end
