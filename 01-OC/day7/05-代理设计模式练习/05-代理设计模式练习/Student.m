//
//  Student.m
//  05-代理设计模式练习
//
//  Created by wei wei on 2023/10/29.
//

#import "Student.h"

@implementation Student
- (void)findHourse
{
    NSLog(@"学生想找房子");
    // 通知代理帮他找房子
    if([self.delegete respondsToSelector:@selector(studentFindHouse:)]) {
//        [self.delegete studentFindHourse];
        [self.delegete studentFindHouse:self];
    }
}
@end
