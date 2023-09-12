//
//  Gun.h
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/12.
//

#import <Foundation/Foundation.h>
#import "Clip.h"

NS_ASSUME_NONNULL_BEGIN

@interface Gun : NSObject
{
    Clip *clip; // 弹夹
}

// 射击
// 注意: 在企业级开发中千万不要随意修改一个方法
- (void)shoot:(Clip *)c;
@end

NS_ASSUME_NONNULL_END
