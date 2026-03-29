//
//  Husband.h
//  03-protocol应用场景1——类型限定
//
//  Created by wei wei on 2023/10/29.
//


#import <Foundation/Foundation.h>
#import "HusbandCondition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Husband : NSObject <HusbandCondition>

@end

NS_ASSUME_NONNULL_END
