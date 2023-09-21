//
//  Phone.h
//  09-继承的其他特性
//
//  Created by wei wei on 2023/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Phone : NSObject
{
    int _cpu;
}

// 打电话
- (void)signalWithNumber:(NSString *)number;

// 发短信
- (void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content;

// 打印品牌信息
+ (void)brand;
@end

NS_ASSUME_NONNULL_END
