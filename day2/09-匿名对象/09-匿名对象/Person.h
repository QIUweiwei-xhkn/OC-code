//
//  Person.h
//  09-匿名对象
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Ipone.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    @public
    int _age; // 年龄
    NSString *_name; // 姓名
}

- (void)say;
// 打电话方法
// phone 电话对象, 只有有了电话对象才能打电话
- (void)signal:(Ipone *)phone;
@end

NS_ASSUME_NONNULL_END
