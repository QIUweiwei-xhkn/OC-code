//
//  QWine.m
//  05-展示单组数据
//
//  Created by wei wei on 2024/3/1.
//

#import "QWine.h"

@implementation QWine
+ (instancetype)wineWithDict: (NSDictionary *)dict {
    QWine *wine = [[self alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    return wine;
}
@end
