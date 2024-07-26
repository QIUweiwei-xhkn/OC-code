//
//  ViewController.m
//  06-小文件下载
//
//  Created by wei wei on 2024/7/25.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;
/** <#注释#>   */
@property(nonatomic, strong) NSMutableData *data;

/** <#注释#>   */
@property(nonatomic, assign) NSInteger totalSize;
@end

@implementation ViewController
- (NSMutableData *)data {
    if(_data == nil) {
        _data = [[NSMutableData alloc] init];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self download3];
}

// 下载图片 方法一
- (void)download {
    // 1.确定url
    NSURL *url = [NSURL URLWithString:@"https://img1.baidu.com/it/u=471951508,1590622431&fm=253&fmt=auto&app=120&f=JPEG?w=831&h=500"];
    // 2.下载图片二进制数据（耗时操作，子线程）
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    // 3.转换
    UIImage *image = [[UIImage alloc] initWithData:imageData];
}

// 不能获得下载进度
// 内存爆炸
- (void)download2 {
    // 下载图片 方法二
//    // 1.确定url
//    NSURL *url = [NSURL URLWithString:@"https://img1.baidu.com/it/u=471951508,1590622431&fm=253&fmt=auto&app=120&f=JPEG?w=831&h=500"];
//    // 2.创建请求
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//    // 3.发送请求
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        // 4.转换
//        UIImage *image = [[UIImage alloc] initWithData:data];
//        self.iamgeView.image = image;
//    }];
    
    
    // 下载视频
    NSURL *url = [ NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4"];
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError) {
            return;
        }
        // 4.写数据到沙盒中
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.mp4"];
        [data writeToFile:fullPath atomically:YES];
        NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
    }];
}

// 内存爆炸
- (void)download3 {
    // 下载视频
    NSURL *url = [ NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4"];
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送请求设置代理
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
//    NSLog(@"%lld", response.expectedContentLength);
    //得到文件的总大小（本次请求的文件数据的总大小）
    self.totalSize = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%zd", data.length);
    [self.data appendData:data];
    // 下载进度 = 已下载的 / 文件总大小
    NSLog(@"%f", 1.0 * self.data.length / self.totalSize);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 确认保存全路径
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.mp4"];
    // 4.写数据到沙盒中
    [self.data writeToFile:fullPath atomically:YES];
    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
}
@end
