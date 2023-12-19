//
//  Person.h
//  11-多态
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
//+ (void)food:(Dog *)dog;
//+ (void)foodCat:(Cat *)cat;
+(void)food:(Animal *)ani;
@end

NS_ASSUME_NONNULL_END
