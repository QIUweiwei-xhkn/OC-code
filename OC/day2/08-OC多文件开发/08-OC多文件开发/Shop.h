//
//  Shop.h
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
#import "Clip.h"

NS_ASSUME_NONNULL_BEGIN

@interface Shop : NSObject
// 买枪
+ (Gun *)buyGun:(int)money;

// 买弹夹
+ (Clip *)buyClip:(int)money;
@end

NS_ASSUME_NONNULL_END
