//
//  ProvinceItem.m
//  04-
//
//  Created by wei wei on 2024/5/15.
//

#import "ProvinceItem.h"

@implementation ProvinceItem
+ (instancetype)itemWithDict:(NSDictionary *)dict {
    ProvinceItem *item = [[ProvinceItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
