//
//  Gun.h
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Clip.h"

// 多文件开发中, 要使用谁就导入谁的.h文件就可以了
// 注意: 导入的一定是.h文件, 不能是.m文件
// 如果导入.m文件会报重复定义错误

NS_ASSUME_NONNULL_BEGIN

@interface Gun : NSObject
{
    Clip *clip; // 弹夹
}

// 射击
// 注意: 在企业级开发中千万不要随意修改一个方法
/**
 *  射击
 *
 *  @param c 弹夹
 */
- (void)shoot:(Clip *)c;
@end

NS_ASSUME_NONNULL_END
