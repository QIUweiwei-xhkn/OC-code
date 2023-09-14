//
//  Iphone.h
//  06-self关键字基本概念
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    kFlahlightStatusOpen,
    kFlahlightStatusClose
}FlahlightStatus;

@interface Iphone : NSObject {
    int _cpu;
}

/**
 *  根据闪光灯的状态拍照
 *
 *  @param status 闪光灯的状态, 开/关
 */
+ (void)carameWithFlahlightStatus:(FlahlightStatus)status;
/**
 *  打开闪光灯
 */
+ (void)openFlahlight;
/**
 * 关闭闪光灯
 */
+ (void)closeFlahlight;

@end

NS_ASSUME_NONNULL_END
