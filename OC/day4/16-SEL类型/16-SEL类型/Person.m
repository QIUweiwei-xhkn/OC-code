//
//  Person.m
//  16-SEL类型
//
//  Created by wei wei on 2023/9/27.
//

#import "Person.h"

@implementation Person
+ (void)test {
    NSLog(@"test");
}
- (void)demo {
    NSLog(@"demo");
}
-(void)signalWithNumber:(NSString *)number {
    NSLog(@"number = %@",number);
}
-(void)sendmesageWihtNumber:(NSString *)number andContent:(NSString *)content {
    NSLog(@"numer = %@, content = %@",number, content);
}
- (void)makeObject:(id)obj andSel:(SEL)sel
{
    [obj performSelector:sel];
}
@end
