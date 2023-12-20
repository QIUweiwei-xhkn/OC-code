//
//  Android.h
//  09-继承的其他特性
//
//  Created by wei wei on 2023/9/20.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

NS_ASSUME_NONNULL_BEGIN

@interface Android : Phone
// 继承了某个类的类我们称之为子类
- (void)setCpu:(int)cpu;
- (int)cpu;
@end

NS_ASSUME_NONNULL_END
