//
//  Wife.h
//  03-protocol应用场景1——类型限定
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "WifeCondition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Wife : NSObject <WifeCondition>

@end

NS_ASSUME_NONNULL_END
