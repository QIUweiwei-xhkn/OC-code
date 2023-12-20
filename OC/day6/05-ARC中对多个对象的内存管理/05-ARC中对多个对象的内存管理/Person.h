//
//  Person.h
//  05-ARC中对多个对象的内存管理
//
//  Created by wei wei on 2023/10/22.
//

#import <Foundation/Foundation.h>
@class Dog;

NS_ASSUME_NONNULL_BEGIN
// MRC, A对象想拥有B对象, 需要对B对象进行一次retain
//      A对象不用B对象了, 需要对B对象进行一次release
//      property的时候进行retain, dealloc的时候进行release

// ARC, A对象想拥有B对象, 那么就需要用一个强指针指向B对象
//      A对象不用B对象了, 什么都不需要做, 编译器会自动帮我们做

@class Dog;
@interface Person : NSObject

// 在ARC中保存一个对象用strong, 相当于MRC中的retain
@property(nonatomic, strong)Dog *dog;
@end

NS_ASSUME_NONNULL_END
