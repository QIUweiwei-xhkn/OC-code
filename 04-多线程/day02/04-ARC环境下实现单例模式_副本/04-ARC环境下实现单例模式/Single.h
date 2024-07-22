//
//  single.h
//  04-ARC环境下实现单例模式
//
//  Created by wei wei on 2024/7/20.
//



#if  __has_feature(objc_arc)
// 条件满足 ARC
// 带参数的宏
#define SingleH(name)  + (instancetype)share##name ;
#define SingleM(name) static id  _instance;\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
+ (instancetype)share##name {\
    return [[self alloc] init];\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone {\
    return _instance;\
}\
\
- (id)mutableCopyWithZone:(nullable NSZone *)zone {\
    return _instance;\
}
#else
// 条件不满足 MRC
// MRC

// 带参数的宏
#define SingleH(name)  + (instancetype)share##name ;
#define SingleM(name) static id  _instance;\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
+ (instancetype)share##name {\
    return [[self alloc] init];\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone {\
    return _instance;\
}\
\
- (id)mutableCopyWithZone:(nullable NSZone *)zone {\
    return _instance;\
}\
- (oneway void)release {\
    \
}\
\
-(instancetype)retain {\
    return _instance;\
}\
\
-(NSUInteger)retainCount {\
    return MAXFLOAT;\
}
#endif
