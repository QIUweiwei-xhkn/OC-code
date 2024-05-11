//
//  Person.m
//  02-UIApplication单例
//
//  Created by wei wei on 2024/4/21.
//

#import "Person.h"

@implementation Person
// 1.程序一运行就创建对象
static Person *_instance;
// 当类被加载到内存中就会调用
+(void)load{
    NSLog(@"%s",__func__);
    _instance = [[Person alloc] init];
    
}
// 2.创建的对象，只有一个
+(instancetype)sharePerson{
    return _instance;
}
// 3.只要一调用alloc 程序就会崩溃
// Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'There can only be one UIApplication instance.'
+(instancetype)alloc {
    if(_instance) {
        // 程序就会崩溃
        NSException *exc = [NSException exceptionWithName:@"There can only be one UIApplication instance" reason:@"There can only be one Person instance" userInfo:nil];
        // 抛出异常
        [exc raise];
    }
    return [super alloc];
}

@end
