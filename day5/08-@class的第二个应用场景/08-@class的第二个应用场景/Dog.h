//
//  Dong.h
//  08-@class的第二个应用场景
//
//  Created by wei wei on 2023/10/21.
//

#import <Foundation/Foundation.h>
//#import "Person.h"
@class Person;
NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
@property(nonatomic, retain)Person *owner;
@end

NS_ASSUME_NONNULL_END
