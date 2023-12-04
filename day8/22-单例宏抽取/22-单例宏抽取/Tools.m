//
//  Tools.m
//  22-单例宏抽取
//
//  Created by wei wei on 2023/12/2.
//

#import "Tools.h"

@implementation Tools
/*
+ (instancetype)shareTools
{
    Tools *instance = [[self alloc] init];
    return instance;
}

static Tools *_instance = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone] init];
    });
    return _instance;
}


- (id)copyWithZone:(NSZone *)zone{

    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

// MRC
- (oneway void)release
{

}

- (instancetype)retain
{
    return _instance;
}

- (NSUInteger)retainCount
{
    return  MAXFLOAT;
}
 */
implementationSingleton(Tools)
@end
