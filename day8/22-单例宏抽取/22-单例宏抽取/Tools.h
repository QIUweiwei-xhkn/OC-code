//
//  Tools.h
//  22-单例宏抽取
//
//  Created by wei wei on 2023/12/2.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject<NSCopying, NSMutableCopying>
// share + 当前的类名
//+ (instancetype)shareTools;
interfaceSingleton(Tools);
@end

NS_ASSUME_NONNULL_END
