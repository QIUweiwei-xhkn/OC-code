//
//  Student.h
//  02-protocol(协议)注意事项
//
//  Created by wei wei on 2023/10/29.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

// 2.父类遵守了某个协议, 那么子类也会自动遵守这个协议
@interface Student : Person

@end

NS_ASSUME_NONNULL_END
