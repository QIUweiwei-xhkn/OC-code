//
//  Person.m
//  11-分类（category）练习
//
//  Created by wei wei on 2023/10/28.
//

#import "Person.h"
#import "NSString+Q.h"

@implementation Person
-(void)test {
    NSString *str = @"fds64jkl43fjdslkf";
    int count = [NSString countWithStr:str];
    NSLog(@"count = %i", count);
}
@end
