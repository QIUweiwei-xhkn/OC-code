//
//  QSettingItem.h
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//typedef enum : NSUInteger {
//    QSettingItemRightViewStateNone,
//    QSettingItemRightViewStateArrow,
//    QSettingItemRightViewStateSwitch,
//} QSettingItemRightViewState;

@interface QSettingItem : NSObject
/** 图标   */
@property(nonatomic, strong) UIImage *icon;

/** 标题   */
@property(nonatomic, copy) NSString *title;

/** 尾部标题   */
@property(nonatomic,copy) NSString *subTitle;

/** 右侧视图   */
//@property(nonatomic, assign) QSettingItemRightViewState type;

/** 开关状态   */
@property(nonatomic, assign, getter=isOn) BOOL on;

+ (instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title;

+ (instancetype)initWithTitle:(NSString *)title;

/** 点击这一行要做的事情   */
@property(nonatomic,copy) void(^operationBlock)(NSIndexPath *indexPath);
@end

NS_ASSUME_NONNULL_END
