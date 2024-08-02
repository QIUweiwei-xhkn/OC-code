//
//  Person.m
//  03-Runtime(消息机制)
//
//  Created by wei wei on 2024/7/31.
//

#import "Person.h"

@implementation Person
- (void)eat {
    NSLog(@"吃");
}

- (void)run:(NSInteger)meter {
    NSLog(@"跑了%ld米", meter);
}
@end
