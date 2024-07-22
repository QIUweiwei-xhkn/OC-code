//
//  QTool.h
//  04-ARC环境下实现单例模式
//
//  Created by wei wei on 2024/7/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTool : NSObject <NSCopying ,NSMutableCopying>
// 类方法
// 1.方便访问
// 2.标明身份
// 3.注意：share+类名|default + 类名 | share | default | 类名
+ (instancetype)shareTool;


@end

NS_ASSUME_NONNULL_END
