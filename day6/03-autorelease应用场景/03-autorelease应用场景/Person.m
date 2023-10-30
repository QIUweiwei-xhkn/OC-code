//
//  Person.m
//  03-autorelease应用场景
//
//  Created by wei wei on 2023/10/22.
//

#import "Person.h"

@implementation Person
+(instancetype)person {
    return [[[self alloc] init] autorelease];
}
-(instancetype)initWithAge:(int)age {
    if(self = [super init])
        _age = age;
    return self;
}
+(instancetype)personWithAge:(int)age {
    /*
    Person *p = [[self alloc] init];
    p.age = age;
    return [p autorelease];
     */
    return [[[self alloc] initWithAge:age] autorelease];
}
- (void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
