//
//  QAccountItem.m
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import "QAccountItem.h"

@implementation QAccountItem
+(instancetype)initWithName:(NSString *)name phone:(NSString *)phone {
    QAccountItem *item = [[QAccountItem alloc] init];
    item.name = name;
    item.phone = phone;
    return item;
}
@end
