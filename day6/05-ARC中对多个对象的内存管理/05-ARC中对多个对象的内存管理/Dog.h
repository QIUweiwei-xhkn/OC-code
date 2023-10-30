//
//  Dog.h
//  05-ARC中对多个对象的内存管理
//
//  Created by wei wei on 2023/10/22.
//

#import <Foundation/Foundation.h>
@class Person;
NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
//@property(nonatomic, strong)Person *owner;
//@property(nonatomic, assign)Person *owner;
// 在ARC中如果保存对象不要用assign, 用weak
// assign是专门用于保存基本数据类型的, 如果保存对象用weak
@property(nonatomic, weak)Person *owner;
@end

NS_ASSUME_NONNULL_END
