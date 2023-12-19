//
//  Dog.m
//  07-MRC转ARC
//
//  Created by wei wei on 2023/10/28.
//

#import "Dog.h"
#import "Bone.h"

@implementation Dog
- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
