//
//  Soldier.m
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/13.
//

#import "Soldier.h"

@implementation Soldier
- (void)fire:(Gun *)gun clip:(Clip *)clip
{
    // 判断是否有枪和子弹
    if (gun !=nil &&
        clip != nil) {
        
        [gun shoot:clip];
    }
}
@end
