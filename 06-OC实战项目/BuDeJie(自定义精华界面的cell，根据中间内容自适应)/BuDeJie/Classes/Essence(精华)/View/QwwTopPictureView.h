//
//  QwwTopPictureView.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QwwTopicItem;

@interface QwwTopPictureView : UIView
/** 模型数据   */
@property(nonatomic, strong) QwwTopicItem *topic;
@end

NS_ASSUME_NONNULL_END
