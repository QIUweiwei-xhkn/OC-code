//
//  QTool.m
//  04-ARC环境下实现单例模式
//
//  Created by wei wei on 2024/7/19.
//

#import "QTool.h"

@implementation QTool 
// 0.创建一个全局变量
static QTool *_instance;

// 1.alloc实际上也调用了allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 加互斥锁解决多线程访问安全问题
//    @synchronized (self) {
//        if(_instance == nil) {
//            _instance = [super allocWithZone:zone];
//        }
//    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
} 


+ (instancetype)shareTool {
    return [[self alloc] init];
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return _instance;
}

#if  __has_feature(objc_arc)
// 条件满足 ARC
#else
// 条件不满足 MRC
// MRC
- (oneway void)release {
    
}

-(instancetype)retain {
    return _instance;
}

-(NSUInteger)retainCount {
    return MAXFLOAT;
}
#endif
@end
