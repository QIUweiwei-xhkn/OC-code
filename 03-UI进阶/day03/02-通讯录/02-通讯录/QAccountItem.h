//
//  QAccountItem.h
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QAccountItem : NSObject
/** 联系人姓名   */
@property(nonatomic, strong) NSString *name;
/** 电话   */
@property(nonatomic, strong) NSString *phone;

+(instancetype)initWithName:(NSString *)name phone:(NSString *)phone;
@end

NS_ASSUME_NONNULL_END
