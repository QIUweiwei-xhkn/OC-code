//
//  QCarGroup.m
//  02-展示汽车数据
//
//  Created by wei wei on 2024/2/27.
//

#import "QCarGroup.h"
#import "QCar.h"

@implementation QCarGroup
+ (instancetype)carGroupWithDict:(NSDictionary *)dict {
    QCarGroup *group = [[self alloc] init];
//    [group setValuesForKeysWithDictionary:dict];
    group.header = dict[@"header"];
    group.footer = dict[@"footer"];
    
    // 字典数组 转 模型数组
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        QCar *car = [QCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    return group;
}
@end
