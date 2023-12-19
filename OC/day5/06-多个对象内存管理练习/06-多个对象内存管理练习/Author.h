//
//  Author.h
//  06-多个对象内存管理练习
//
//  Created by wei wei on 2023/10/20.
//

#import <Foundation/Foundation.h>
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface Author : NSObject
//用户昵称(name)
@property(nonatomic, retain)NSString *name;

//用户头像(icon)
@property(nonatomic, retain)NSString *icon;

//用户是否是会员(vip)
@property(nonatomic, assign, getter=isVip)BOOL vip;

//用户对应的账号(account)
@property(nonatomic, retain)Account *account;

//用户的生日(birthday)
@property(nonatomic, assign)MyDate birthday;

@end

NS_ASSUME_NONNULL_END
