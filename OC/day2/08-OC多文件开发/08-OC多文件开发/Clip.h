//
//  Clip.h
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/12.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Clip : NSObject
{
@public
    int _bullet; // 子弹
}


/**
 *  上子弹
 */
- (void)addBullet;
@end

NS_ASSUME_NONNULL_END
