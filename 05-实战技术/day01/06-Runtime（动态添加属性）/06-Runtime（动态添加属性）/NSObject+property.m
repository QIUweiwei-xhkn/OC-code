//
//  NSObject+property.m
//  06-Runtime（动态添加属性）
//
//  Created by wei wei on 2024/7/31.
//

#import "NSObject+property.h"
#import <objc/message.h>

@implementation NSObject (property)
//static NSString *_name;

- (void)setName:(NSString *)name {
//    _name = name;
    // 让字符串与当前对象产生联系
    /*
     第一个参数：object 给那个对象添加属性
     第二个参数：key 属性名称
     第三个参数：value 属性值
     第四个参数：policy 保存策略
     */
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
//    return _name ;
    return objc_getAssociatedObject(self, @"name");
}


@end
