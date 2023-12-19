//
//  Person.m
//  01-引用计时器
//
//  Created by wei wei on 2023/10/9.
//

#import "Person.h"

@implementation Person
- (void)dealloc {
    NSLog(@"Person dealloc");
    // 注意:super dealloc一定要写到所有代码的最后
    // 一定要写在dealloc方法的最后面
    [super dealloc];
}
@end
