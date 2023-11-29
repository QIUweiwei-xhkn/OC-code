//
//  Person.m
//  19-copy和Property
//
//  Created by wei wei on 2023/11/28.
//

#import "Person.h"

@implementation Person
-(void)dealloc {
    // 只要给block发送一条release消息, block中使用到的对象也会收到该消息
    Block_release(_pBlock);
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
