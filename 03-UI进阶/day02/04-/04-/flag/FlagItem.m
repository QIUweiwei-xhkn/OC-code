//
//  FlagItem.m
//  04-
//
//  Created by wei wei on 2024/5/14.
//

#import "FlagItem.h"

@implementation FlagItem
+ (instancetype)itemWithDict:(NSDictionary *)dict {
    FlagItem *item = [[FlagItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
