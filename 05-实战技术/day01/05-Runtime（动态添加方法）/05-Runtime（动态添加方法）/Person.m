//
//  Person.m
//  05-Runtime（动态添加方法）
//
//  Created by wei wei on 2024/7/31.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person
// 没有返回值，也没有参数
void aaa(id self, SEL _cmd, NSNumber *meter) {
    NSLog(@"跑了%@米", meter);
}

// 什么时候调用：只要一个对象调用了还未实现的方法的时候调用该方法，进行处理
// 作用：动态添加方法，处理未实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%@", NSStringFromSelector(sel));
    
    if(sel == NSSelectorFromString(@"run:")) {
        /*
         第一个参数：Class 给哪个类添加方法
         第二个参数：SEL 添加哪个方法
         第三个参数：IMP 方法实现 ==》 函数 ==〉 函数路口 ==》 函数名
         第四个参数：types 方法类型
         
         */
        class_addMethod(self, sel, (IMP)aaa, "v@:@");
    }
    
    return [super resolveInstanceMethod:sel];
}

//- (void)test {
//    + (BOOL)resolveInstanceMethod:(SEL)sel {
//        NSLog(@"%@", NSStringFromSelector(sel));
//        
//        if(sel == NSSelectorFromString(@"eat")) {
//            /*
//             第一个参数：Class 给哪个类添加方法
//             第二个参数：SEL 添加哪个方法
//             第三个参数：IMP 方法实现 ==》 函数 ==〉 函数路口 ==》 函数名
//             第四个参数：types 方法类型
//             
//             */
//            class_addMethod(self, sel, (IMP)aaa, "v@:");
//        }
//        
//        return [super resolveInstanceMethod:sel];
//    }
//}
@end
