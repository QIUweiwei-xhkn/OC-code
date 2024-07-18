//
//  QSaveTool.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QSaveTool.h"

@implementation QSaveTool
+ (NSString *)objectForKey:(NSString *)defaultName { 
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName {
    if( defaultName) {
        // 屏蔽一下外界的行为
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        // 立即存储
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
