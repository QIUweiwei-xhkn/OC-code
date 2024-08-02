//
//  Person.h
//  01-IOS9新特性之泛型
//
//  Created by wei wei on 2024/7/31.
//

#import <Foundation/Foundation.h>
#import "Language.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person <__contravariant ObjectType> : NSObject
/** 语言   */
@property(nonatomic, strong) ObjectType language;
@end

NS_ASSUME_NONNULL_END
