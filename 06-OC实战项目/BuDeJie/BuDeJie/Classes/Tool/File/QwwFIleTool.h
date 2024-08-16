//
//  QwwFIleTool.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QwwFIleTool : NSObject

/// 获得文件夹的尺寸
/// - Parameter directoryPath: 文件夹路径
/// 返回值：返回文件夹尺寸
+ (void)getFileSize:(NSString *)directoryPath compeletion:(void(^)(NSInteger))completion;


/// 删除文件夹中的所有的文件
/// - Parameter directioryPath: 文件夹路径
+ (void)removeData:(NSString *)directioryPath;
@end

NS_ASSUME_NONNULL_END
