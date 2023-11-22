//
//  Person.h
//  01-protocol（协议）的基本概念
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "sportProtocol.h"
#import "studyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// 3.在OC中一个类可以遵守1个或多个协议
// 注意: OC中的类只能有一个父类, 也就是说OC只有单继承
@interface Person : NSObject <sportProtocol, studyProtocol>

@end

NS_ASSUME_NONNULL_END
