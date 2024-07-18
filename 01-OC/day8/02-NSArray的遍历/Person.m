//
//  Person.m
//  02-NSArray的遍历
//
//  Created by wei wei on 2023/11/26.
//

#import "Person.h"

@implementation Person
- (void)say {
    NSLog(@"加油");
}

- (void)sayWithName:(NSString *)name {
    NSLog(@"%@ 加油", name);
}
@end
