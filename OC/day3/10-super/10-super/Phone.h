//
//  Phone.h
//  10-super
//
//  Created by wei wei on 2023/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum
{
    kFlahlightStatusOpen,
    kFlahlightStatusClose
} FlahlightStatus;

// 被继承的这个类我们称之为父类/ 超类
@interface Phone : NSObject


+ (void)carameWithFlahlightStatus:(FlahlightStatus)status;
- (void)carameWithFlahlightStatus:(FlahlightStatus)status;
+ (void)openFlahlight;
+ (void)closeFlahlight;
@end

NS_ASSUME_NONNULL_END
