//
//  QappsItem.m
//  12-多图下载综合案例1
//
//  Created by wei wei on 2024/7/20.
//

#import "QappsItem.h"

@implementation QappsItem
+(instancetype)appWithDict:(NSDictionary *)dict {
    QappsItem *item = [[QappsItem alloc] init];
//    item.name = dict[@"name"];
//    item.icon = dict[@"icon"];
//    item.download = dict[@"download"];
    // KVC
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
