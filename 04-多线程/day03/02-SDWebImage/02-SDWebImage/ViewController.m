//
//  ViewController.m
//  02-SDWebImage
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "SDWebImage/SDWebImageManager.h"
#import "SDWebImage/SDWebImageDownloader.h"
#import "SDWebImage/UIImage+GIF.h"
#import "SDWebImage/NSData+ImageContentType.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self type];
}

// 1.下载图片且需要获得图片下载进度，会自动做内存缓存和磁盘缓存
-(void)download {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://img0.baidu.com/it/u=760742010,2566588107&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=716"] placeholderImage:[UIImage imageNamed:@"1"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        switch (cacheType) {
            case SDImageCacheTypeNone:
                NSLog(@"直接下载");
                break;
            case SDImageCacheTypeDisk:
                NSLog(@"磁盘缓存 ");
                break;
            case SDImageCacheTypeMemory:
                NSLog(@"内存缓存 ");
                break;
            default:
                break;
        }
    }];
    
    NSLog(@"%@", [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
}

// 只需要简单获得一张图片，不设置
// 内存缓存&磁盘缓存
-(void)download2 {
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:@"https://img0.baidu.com/it/u=760742010,2566588107&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=716"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"download progess --- %f", 1.0 * receivedSize / expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        self.imageView.image = image;
    }];
}

// 不需要任务的缓存处理
// 不做任何缓存处理
-(void)download3 {
    // data 图片的二进制数据
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:@"https://img0.baidu.com/it/u=760742010,2566588107&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=716"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        self.imageView.image = image;
            }];
        }];
}


-(void)gif {
//    NSLog(@"%s",__func__);
//    self.imageView.image = [UIImage imageNamed:@"2.gif"];
    
    UIImage *image = [UIImage sd_animatedGIFNamed:@"2"];
    self.imageView.image = image;
}

- (void)type {
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/weiwei/Desktop/截屏2024-07-11 22.38.38.png"];
    NSString *typeStr = [NSData sd_contentTypeForImageData:data];
    NSLog(@"%@", typeStr);
}
@end
