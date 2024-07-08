//
//  Person.m
//  03-归档
//
//  Created by wei wei on 2024/5/26.
//

#import "Person.h"

@implementation Person
// NSCoding协议方法：将需要归档的属性进行归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInteger:self.age forKey:@"age"];
}

// NSCoding协议方法：将需要解档的属性进行解档
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if(self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntForKey:@"age"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %ld", self.name, self.age];
}
@end
