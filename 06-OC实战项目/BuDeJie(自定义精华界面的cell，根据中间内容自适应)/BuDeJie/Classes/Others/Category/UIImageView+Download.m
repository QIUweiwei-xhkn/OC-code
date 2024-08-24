//
//  UIImageView+Download.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/21.
//

#import "UIImageView+Download.h"
#import "SDImageCache.h"
#import "AFNetworkReachabilityManager.h"
#import "TZImagePickerController.h"


@implementation UIImageView (Download)
- (void)qww_setOriginImage:(NSString *)originImageURL andThumbnailImage:(NSString *)thunmbnailImageURL placehoderImage:(UIImage *)placehoderImage completed:(SDWebImageCompletionBlock)completedBlock{
    
//    SDWebImageCacheKeyFilter *filter = [SDWebImageCacheKeyFilter cacheKeyFilterWithBlock:^(NSURL *url) {
//        // 所有的缓存图片的key都有一个 -qww的后缀
//        return [NSString stringWithFormat:@"%@-qww", url.absoluteURL];
//    }];
//    [[SDWebImageManager sharedManager] setCacheKeyFilter:filter];
    
    
    // 根据网络状态来加载图片
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 获得原图（大图）（SDWebImage的图片缓存是用图片的url字符串作为key）
    UIImage *originImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:originImageURL];
    if(originImage) {  // 大图已经下载过
//        self.image = originImage;
//        completedBlock(originImage, nil, 0, [NSURL URLWithString:originImageURL]);
        [self sd_setImageWithURL:[NSURL URLWithString:originImageURL] placeholderImage:placehoderImage completed:completedBlock];
    } else {    // 大图还未下载
        if(mgr.isReachableViaWiFi ) {
            [self sd_setImageWithURL:[NSURL URLWithString:originImageURL] placeholderImage:placehoderImage completed:completedBlock];
        } else if(mgr.isReachableViaWWAN) {
#warning downloadOriginImageWhen3GOr4G 配置项的值需要要从沙盒中取出
            // 3G/4G网络下载的时候下载原图
            BOOL downloadOriginImageWhen3GOr4G = YES;
            if(downloadOriginImageWhen3GOr4G) {
                [self sd_setImageWithURL:[NSURL URLWithString:thunmbnailImageURL] placeholderImage:placehoderImage completed:completedBlock];
            }else {
                [self sd_setImageWithURL:[NSURL URLWithString:thunmbnailImageURL] placeholderImage:placehoderImage completed:completedBlock];
            }
        } else {    // 没有可用网络
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:thunmbnailImageURL];
            if(thumbnailImage) {    // 缩略图已经被下载过
//                self.image = thumbnailImage;
//                completedBlock(thumbnailImage, nil, 0, [NSURL URLWithString:thunmbnailImageURL]);
                [self sd_setImageWithURL:[NSURL URLWithString:thunmbnailImageURL] placeholderImage:placehoderImage completed:completedBlock];
            } else {    // 缩略图未被下载，设为占位图
//                self.image = placehoderImage;   // 设为占位图
                [self sd_setImageWithURL:nil placeholderImage:placehoderImage completed:completedBlock];
            }
       }
    }
}

- (void)qww_setHeader:(NSString *)headerURL {
    UIImage *placehoderImage = [UIImage qww_circleImageName:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:headerURL] placeholderImage:placehoderImage options:0 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        // 图片下载失败，直接返回
        if(image == nil) return;
        self.image = [image qww_circleImage];
    }];
}
@end
