//
//  Person.m
//  08-super,superClass,class
//
//  Created by wei wei on 2024/8/1.
//

#import "Person.h"

@implementation Person
- (void)test {
    // self --> SubPerson
    NSLog(@"%@ %@ %@ %@", [self class], [self superclass], [super class], [super superclass]);
}
@end
