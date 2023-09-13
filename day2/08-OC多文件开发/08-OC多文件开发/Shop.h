//
//  Shop.h
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
NS_ASSUME_NONNULL_BEGIN

@interface Shop : NSObject
/**
 卖枪方法
 monery: 购买枪的价格
 */
+ (Gun *)buyGun:(int)monery;

/**
 *  卖弹夹
 *
 *  @param monery 钱
 *
 *  @return 弹夹
 */
+ (Clip *)buyClip:(int)monery;
@end

NS_ASSUME_NONNULL_END
