//
//  Person.h
//  02-IOS9新特性之__kindof
//
//  Created by wei wei on 2024/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
+ (__kindof Person *)person;
@end

NS_ASSUME_NONNULL_END
