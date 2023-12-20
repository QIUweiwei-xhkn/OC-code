//
//  WifeCondition.h
//  03-protocol应用场景1——类型限定
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WifeCondition <NSObject>
// 会做饭
- (void)cooking;
// 会洗衣服
- (void)washing;
// 有一份好工作
- (void)job;
@end

NS_ASSUME_NONNULL_END
