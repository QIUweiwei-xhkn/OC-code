//
//  QwwTopicItem.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//typedef enum {
//    /** 全部*/
//    QwwTopicTypeAll = 1,
//    /** 图片*/
//    QwwTopicTypePicture = 10,
//    /** 段子*/
//    QwwTopicTypeWord = 29,
//    /** 声音*/
//    QwwTopicTypeVoice = 31,
//    /** 视频 */
//    QwwTopicTypeVideo = 41
//} QwwTopicType;

typedef NS_ENUM(NSInteger, QwwTopicType) {
    /** 全部*/
    QwwTopicTypeAll = 1,
    /** 图片*/
    QwwTopicTypePicture = 10,
    /** 段子*/
    QwwTopicTypeWord = 29,
    /** 声音*/
    QwwTopicTypeVoice = 31,
    /** 视频 */
    QwwTopicTypeVideo = 41
};

@interface QwwTopicItem : NSObject
/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *passtime;

/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;

/** 模型数据的类型  1为全部   10为图片   29为段子   31为音频   41为视频*/
@property (nonatomic, assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
