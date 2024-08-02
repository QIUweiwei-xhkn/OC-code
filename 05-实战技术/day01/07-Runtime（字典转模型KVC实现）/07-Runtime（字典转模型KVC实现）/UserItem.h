//
//  UserItem.h
//  07-Runtime（字典转模型KVC实现）
//
//  Created by wei wei on 2024/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserItem : NSObject
@property(nonatomic, strong) NSString *profile_image_url;

@property(nonatomic, assign) BOOL vip;

@property(nonatomic, strong) NSString *name;

@property(nonatomic, assign) NSInteger mbrank;

@property(nonatomic, assign) NSInteger mbtype;
@end

NS_ASSUME_NONNULL_END
