//
//  Status.h
//  06-多个对象内存管理练习
//
//  Created by wei wei on 2023/10/20.
//

#import <Foundation/Foundation.h>
#import "Author.h"

NS_ASSUME_NONNULL_BEGIN

@interface Status : NSObject
//微博正文(text)
@property(nonatomic, retain)NSString *text;

//微博配图(picture)
@property(nonatomic, retain)NSString *picture;

//微博发布的时间(createTime)
@property(nonatomic, assign)MyDate createTime;

//微博对应的作者(用户)(author)
@property(nonatomic, retain)Author *author;

//评论数(commentCount)
@property(nonatomic, assign)int commentCount;
//转发数(retweetCount)
@property(nonatomic, assign)int retweetCount;
//赞数(likeCount)
@property(nonatomic, assign)int likeCount;

//转发微博(repostStatus)
@property(nonatomic, retain)Status *repostStatus;

@end

NS_ASSUME_NONNULL_END
