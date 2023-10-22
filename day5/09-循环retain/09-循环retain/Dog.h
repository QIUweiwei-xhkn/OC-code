//
//  Dog.h
//  09-循环retain
//
//  Created by wei wei on 2023/10/21.
//

#import <Foundation/Foundation.h>
@class Person;
NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
//@property(nonatomic, retain)Person *owner;
@property(nonatomic, assign)Person *owner;
@end

NS_ASSUME_NONNULL_END
