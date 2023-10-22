//
//  Room.m
//  03-多个对象的内存管理
//
//  Created by wei wei on 2023/10/10.
//

#import "Room.h"

@implementation Room
-(void)dealloc {
    NSLog(@"%s num = %i",__func__, _num);
    [super dealloc];
}

@end
