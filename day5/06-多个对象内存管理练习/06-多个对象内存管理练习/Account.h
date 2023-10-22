//
//  Account.h
//  06-多个对象内存管理练习
//
//  Created by wei wei on 2023/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef struct {
    int year;
    int month;
    int day;
    int hour;
    int minute;
    int second;
}MyDate;

@interface Account : NSObject
//注册的时间(registerTime)
@property(nonatomic, assign)MyDate registerTime;
//账号(email)
@property(nonatomic, retain)NSString *email;

//密码(pwd)
@property(nonatomic, retain)NSString *pwd;
@end

NS_ASSUME_NONNULL_END
