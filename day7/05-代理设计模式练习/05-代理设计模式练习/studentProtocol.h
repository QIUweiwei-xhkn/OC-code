//
//  studentProtocol.h
//  05-代理设计模式练习
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol studentProtocol <NSObject>
// 帮学生找房子
- (void)studentFindHourse;
@end

NS_ASSUME_NONNULL_END
