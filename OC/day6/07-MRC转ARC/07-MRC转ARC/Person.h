//
//  Person.h
//  07-MRC转ARC
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>
@class Dog;

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic, strong)Dog *dog;
@end

NS_ASSUME_NONNULL_END
