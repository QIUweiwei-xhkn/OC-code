//
//  Person.m
//  09-匿名对象
//
//  Created by wei wei on 2023/9/12.
//

#import "Person.h"
// .h和.m之间切换 command  + control + ⬆️
@implementation Person
-(void)say {
    NSLog(@"name ia %@, age is %i", _name, _age);
}
-(void)signal:(Iphone *)phone {
    [phone CallWithNumber:12345];
}
@end
