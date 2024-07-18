//
//  QCar.m
//  02-展示汽车数据
//
//  Created by wei wei on 2024/2/27.
//

#import "QCar.h"

@implementation QCar
+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon {
    QCar *car = [[self alloc] init];
    car.name = name;
    car.icon = icon;
    return car;
}
@end
