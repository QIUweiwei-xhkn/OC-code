//
//  Student.h
//  04-protocol应用场景2-代理设计模式
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "babyProtocol.h"
@class Baby;
NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject <babyProtocol>
//// 喂婴儿吃东西
//- (void)feedFood:(Baby *)baby;
//
//// 哄婴儿睡觉
//- (void)hongBaby:(Baby *)baby;
@end

NS_ASSUME_NONNULL_END
