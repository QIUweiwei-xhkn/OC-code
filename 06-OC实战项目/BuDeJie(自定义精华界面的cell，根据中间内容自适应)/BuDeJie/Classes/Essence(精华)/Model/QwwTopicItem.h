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

/** 最热评论   */
@property(nonatomic, strong) NSDictionary *top_cmt;

/** 模型数据的类型  1为全部   10为图片   29为段子   31为音频   41为视频*/
@property (nonatomic, assign) NSInteger type;

/** 宽度（像素）   */
@property(nonatomic, assign) CGFloat width;
/** 高度（像素）   */
@property(nonatomic, assign) CGFloat height;

/** 小图   */
@property(nonatomic,copy) NSString *image0;
/** 中图   */
@property(nonatomic,copy) NSString *image2;
/** 大图   */
@property(nonatomic,copy) NSString *image1;
/** 是否为 gif 图片   */
@property(nonatomic, assign) BOOL is_gif;

/** 音频时长   */
@property(nonatomic, assign) NSInteger voicetime;
/** 视频时长   */
@property(nonatomic, assign) NSInteger videotime;
/** 音频/视频的播放次数   */
@property(nonatomic, assign) NSInteger playcount;

/* 额外增加的属性（并非服务器返回的属性，仅仅是为了提高开发效率）*/
/** 根据当前模型计算出来的cell高度 */
@property(nonatomic, assign) CGFloat cellHeight;
/** 中间空间的的frame   */
@property(nonatomic, assign) CGRect middleFrame;
/** 是否为大/超长图片   */
@property(nonatomic, assign, getter=isBigPicture) BOOL bigPicture;

@end

NS_ASSUME_NONNULL_END
