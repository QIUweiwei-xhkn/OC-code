//
//  Person.m
//  09-构造方法练习
//
//  Created by wei wei on 2023/9/24.
//

#import "Person.h"

@implementation Person
- (instancetype)init {
    if(self = [super init]) {
        _age = 10;
    } return self;
}
-(NSString *)description {
    return [NSString stringWithFormat:@"age = %i",_age];
}
@end
