//
//  QStatus.h
//  07-自定义不等高cell
//
//  Created by wei wei on 2024/3/13.
//

#import <UIKit/UIKey.h>

NS_ASSUME_NONNULL_BEGIN

@interface QStatus : NSObject
/** 头像   */
@property(nonatomic,copy) NSString *icon;

/** 昵称   */
@property(nonatomic,copy) NSString *name;

/** 正文   */
@property(nonatomic,copy) NSString *text;

/** VIP   */
@property(nonatomic, assign, getter=isVip) BOOL vip;

/** 配图   */
@property(nonatomic,copy) NSString *picture;

@property(nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
