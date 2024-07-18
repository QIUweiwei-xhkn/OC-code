//
//  QSettingItem.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QSettingItem.h"

@implementation QSettingItem
+ (instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title {
    QSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)initWithTitle:(NSString *)title {
    QSettingItem *item = [[self alloc] init];
    item.title = title;
    return item;
}
@end
