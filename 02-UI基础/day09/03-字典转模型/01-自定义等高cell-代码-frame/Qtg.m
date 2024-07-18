//
//  Qtg.m
//  01-自定义等高cell-代码-frame
//
//  Created by wei wei on 2024/3/5.
//

#import "Qtg.h"

@implementation Qtg
+ (instancetype)tgWithDict:(NSDictionary *)dict {
    Qtg *tg = [[self alloc] init];
    [tg setValuesForKeysWithDictionary:dict];
    return tg;
}
@end
