//
//  StatusItem.h
//  07-Runtime（字典转模型KVC实现）
//
//  Created by wei wei on 2024/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class UserItem;
// 设计模型有哪些属性 => 字典
// KVC：模型中属性必须与字典中key一一对应
@interface StatusItem : NSObject
// 自动生成
//@property(nonatomic, strong) NSString *source;

@property(nonatomic, assign) NSInteger reposts_count;

@property(nonatomic, strong) NSArray *pic_urls;

@property(nonatomic, strong) NSString *created_at;

//@property(nonatomic, assign) BOOL isArr;

@property(nonatomic, assign) NSInteger attitudes_count;

@property(nonatomic, strong) NSString *idstr;

@property(nonatomic, strong) NSString *text;

@property(nonatomic, assign) NSInteger comments_count;

@property(nonatomic, strong) UserItem *user;



+ (instancetype)itemWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
