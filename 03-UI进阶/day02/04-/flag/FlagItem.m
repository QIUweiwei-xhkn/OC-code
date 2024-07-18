//
//  FlagItem.m
//  04-拦截用户输入案例
//
//  Created by wei wei on 2024/5/12.
//

#import "FlagItem.h"

@implementation FlagItem
+ (instancetype)itemWithDict:(NSDictionary *)dict {
    FlagItem *item = [[FlagItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
