//
//  Car.h
//  07-@class
//
//  Created by wei wei on 2023/10/21.
//

#import <Foundation/Foundation.h>
//#import "Wheel.h"
@class Wheel;

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject
@property(nonatomic, retain)Wheel *wheel;
@end

NS_ASSUME_NONNULL_END
