//
//  Person.m
//  02-野指针和空指针
//
//  Created by wei wei on 2023/10/10.
//

#import "Person.h"

@implementation Person
-(void)dealloc {
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
