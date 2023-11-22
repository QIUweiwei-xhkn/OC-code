//
//  crazySportProtocol.h
//  02-protocol(协议)注意事项
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "sportProtocol.h"
NS_ASSUME_NONNULL_BEGIN

// 4.OC中的协议又可以遵守其它协议, 只要一个协议遵守了其它协议, 那么这个协议中就会自动包含其它协议的声明
@protocol crazySportProtocol <sportProtocol>
-(void)jumping;
@end

NS_ASSUME_NONNULL_END
