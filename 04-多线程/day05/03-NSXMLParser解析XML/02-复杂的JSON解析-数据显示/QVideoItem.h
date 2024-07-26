//
//  QVideoItem.h
//  02-复杂的JSON解析-数据显示
//
//  Created by wei wei on 2024/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QVideoItem : NSObject
/*
 "id": 1,
 "image": "resources/images/minion_01.png",
 "length": 10,
 'name"：“小黄人 第01部"，
 "url": "resources/videos/minion_01.mp4"
 */
/** ID   */
@property(nonatomic, strong) NSString *ID;
/** 图片   */
@property(nonatomic, strong) NSString *image;
/** 播放时长   */
@property(nonatomic, strong) NSString *length;
/** 名称   */
@property(nonatomic, strong) NSString *name;
/** 视频路径   */
@property(nonatomic, strong) NSString *url;

//+ (instancetype)videoWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
