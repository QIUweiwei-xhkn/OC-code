//
//  QPerson.m
//  09-KVC的使用
//
//  Created by wei wei on 2024/2/7.
//

#import "QPerson.h"

@implementation QPerson
{
    int _age;
}

- (void)printAge {
    NSLog(@"age:%d", _age);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@-------age:%d", _name, _age];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if(self = [super init]) {
        /*
         self.name = dict[@"name"];
         self.age = [dict[@"age"] intValue];
         */
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)perosnWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
