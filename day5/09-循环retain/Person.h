//
//  Person.h
//  09-循环retain
//
//  Created by wei wei on 2023/10/21.
//

#import <Foundation/Foundation.h>
@class Dog;
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic, retain, nullable)Dog *dog;
@end

NS_ASSUME_NONNULL_END
