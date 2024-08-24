//
//  QwwFIleTool.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/15.
//

#import "QwwFIleTool.h"

@implementation QwwFIleTool
// 自己计算缓存
+ (void)getFileSize:(NSString *)directoryPath compeletion:(void(^)(NSInteger))completion {
    // NSFileManager
    // attributesOfItemAtPath：指定文件路径，就能获取文件属性
    // 把所有文件尺寸加起来
    // 遍历文件夹中所有的文件，一个个相加
    
    // 创建文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
//    BOOL isDirectoryPath;
//    BOOL isExists = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectoryPath];
//    if(!isExists || isDirectoryPath) {
//        // 抛出异常
//        NSException *excp = [NSException exceptionWithName:@"fileError" reason:@"需要传入的参数应该是一个文件夹路径， 并且路径存在" userInfo:nil];
//        [excp raise];
//    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 获得文件夹下所有的子路径, 包括子路径的子路径
        NSInteger totalSize = 0;
        NSArray *subPaths = [mgr subpathsAtPath:directoryPath];
        for (NSString *subPath in subPaths) {
            // 获得文件的全路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            // 判断隐藏文件
            if([filePath containsString:@".DS"]) continue;
            // 判断是否是文件夹
            BOOL isDirectory;
            BOOL isExists = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
            if(!isExists || isDirectory) continue;
            // 获得文件属性
            NSDictionary *attributes =  [mgr attributesOfItemAtPath:filePath error:nil];
        
            // default的尺寸
            NSInteger size = [attributes fileSize];
            totalSize += size;
        }
        // 计算完成回调
        dispatch_sync(dispatch_get_main_queue(), ^{
            if(completion) {
                completion(totalSize);
            }
        });
    });
    
}

+ (void)removeData:(NSString *)directioryPath {
    
    // 清除缓存
    // 获得文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
//    BOOL isDirectoryPath;
//    BOOL isExists = [mgr fileExistsAtPath:directioryPath isDirectory:&isDirectoryPath];
//    if(!isExists || isDirectoryPath) {
//        // 抛出异常
//        NSException *excp = [NSException exceptionWithName:@"fileError" reason:@"需要传入的参数应该是一个文件夹路径， 并且路径存在" userInfo:nil];
//        [excp raise];
//    }
    // 获得cache文件夹下的所有文件， 不包括子路径的子路径
    NSArray *subPaths = [mgr contentsOfDirectoryAtPath:directioryPath error:nil];
    for (NSString *subPath in subPaths) {
        // 拼接文件全路径
        NSString *filePath = [directioryPath stringByAppendingPathComponent:subPath];
        // 删除路径
        [mgr removeItemAtPath:filePath error:nil];
    }
}
@end
