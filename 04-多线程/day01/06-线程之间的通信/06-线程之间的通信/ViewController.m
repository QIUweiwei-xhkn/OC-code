//
//  ViewController.m
//  06-线程之间的通信
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"https://image14.m1905.cn/uploadfile/2015/0724/20150724021558761386.jpg"];
    [self loadImageAsynchronouslyWithURL2:url];
}

- (void)downLoad {
    // https://image14.m1905.cn/uploadfile/2015/0724/20150724021558761386.jpg
//    
//    // 1.确定URL
//    NSURL *url = [NSURL URLWithString:@"https://image14.m1905.cn/uploadfile/2015/0724/20150724021558761386.jpg"];
//    
//    // 2.根据URL下载图片二进制数据到本地
//    NSData *data = [NSData dataWithContentsOfURL:url]; // Synchronous URL loading of https://image14.m1905.cn/uploadfile/2015/0724/20150724021558761386.jpg should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession.
//    
//    // 3.转换图片格式
//    UIImage *image = [UIImage imageWithData:data];
//    
//    // 4.显示UI
//    self.imageView.image = image;
//    
    
}

- (void)loadImageAsynchronouslyWithURL:(NSURL *)imageURL {
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error && data) {
            UIImage *image = [UIImage imageWithData:data];
            // 在主线程中更新 UI，设置 UIImageView 的图片
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            NSLog(@"加载网络图片失败");
        }
    }] resume];
}

- (void)loadImageAsynchronouslyWithURL2:(NSURL *)imageURL {
//    NSDate *start = [NSDate now];
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error && data) {
            UIImage *image = [UIImage imageWithData:data];
            // 在主线程中更新 UI，设置 UIImageView 的图片
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.imageView.image = image;
//            });
            
            // 返回主线程 方法二
//            [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:NO];
//            NSLog(@"end");
            
            // 返回主线程 方法三
//            [self performSelector:@selector(showImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:NO];
//            NSLog(@"end");
            
            // 方法四
            // 直接调用imageView的setimage方法 
            [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
        } else {
            NSLog(@"加载网络图片失败");
        }
    }] resume];
    
//    NSDate *end = [NSDate now];
//    NSLog(@"%f", [end timeIntervalSinceDate:start]);
    
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    NSLog(@"%f", end - start);
}

- (void)showImage:(UIImage *)image {
    self.imageView.image = image;
    NSLog(@"UI----%@", [NSThread currentThread]);
}
@end
