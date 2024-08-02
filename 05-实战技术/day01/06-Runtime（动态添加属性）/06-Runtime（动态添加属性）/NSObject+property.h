//
//  NSObject+property.h
//  06-Runtime（动态添加属性）
//
//  Created by wei wei on 2024/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (property)
// @property 分类，只会生成set，get 方法的声明，不会生成set和get方法的实现，也不会生成下划线成员属性
@property NSString *name;
@end

NS_ASSUME_NONNULL_END
