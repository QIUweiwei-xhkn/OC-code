//
//  NSDictionary+Log.m
//  05-多值参数和中文输出
//
//  Created by wei wei on 2024/7/24.
//
#import <Foundation/Foundation.h>

@implementation NSDictionary (Log)
// 重写系统的方法控制输出
-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:@"{"];
    
    // 拼接key--value
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [str appendFormat:@"%@:", key];
        [str appendFormat:@"%@,", obj];
    }];
    
    [str appendFormat:@"}"];
    // 删除逗号
    // 从后往前找
    NSRange rangle = [str rangeOfString:@"," options:NSBackwardsSearch];
    if(rangle.location != NSNotFound) {
        [str deleteCharactersInRange:rangle];
    } 
    return str;
}
@end


@implementation NSArray (Log)
// 重写系统的方法控制输出
-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:@"["];
    
    // 拼接obj
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [str appendFormat:@"%@,\n", obj];
    }];
    
    [str appendFormat:@"]"];
    
    // 删除逗号
    // 从后往前找
    NSRange rangle = [str rangeOfString:@"," options:NSBackwardsSearch];
    if(rangle.location != NSNotFound) {
        [str deleteCharactersInRange:rangle];
    }
    return str;
}
@end
