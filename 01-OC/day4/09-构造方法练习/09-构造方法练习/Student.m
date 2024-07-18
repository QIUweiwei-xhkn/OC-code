//
//  Student.m
//  09-构造方法练习
//
//  Created by wei wei on 2023/9/24.
//

#import "Student.h"

@implementation Student
- (instancetype)init {
    if(self = [super init]) {
//        [self setAge:10];
        _number = 1;
    }return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"age = %i, numer = %i",[self age],_number];
}
@end
