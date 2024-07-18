//
//  QSettingGroup.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QSettingGroup.h"

@implementation QSettingGroup
+ (instancetype)initWithItems:(NSArray *)itemsArr {
    QSettingGroup *group = [[self alloc] init];
    group.itemsArr = itemsArr;
    return group;
}
@end
