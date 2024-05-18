//
//  Person.h
//  05-字符串strong
//
//  Created by wei wei on 2024/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
// 外面修改了字符串，不会影响里面
@property(nonatomic,strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
