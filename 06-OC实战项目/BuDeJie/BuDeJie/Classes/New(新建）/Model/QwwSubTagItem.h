//
//  QwwSubTagItem.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// image_list, sub_number, theme_name
@interface QwwSubTagItem : NSObject
/** 头像   */
@property(nonatomic, strong) NSString *image_list;
/** 关注人数   */
@property(nonatomic, strong) NSString *sub_number;
/** 名称   */
@property(nonatomic, strong) NSString *theme_name;

@end

NS_ASSUME_NONNULL_END
