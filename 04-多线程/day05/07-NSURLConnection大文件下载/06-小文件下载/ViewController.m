//
//  ViewController.m
//  06-小文件下载
//
//  Created by wei wei on 2024/7/25.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UISlider *progressView;


/** <#注释#>   */
@property(nonatomic, assign) NSInteger totalSize;

@property(nonatomic, assign) NSInteger currentSize;

/** 保存文件全路径   */
@property(nonatomic, strong) NSString *fullPath;

/** 句柄   */
@property(nonatomic, strong) NSFileHandle *handle;
@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self download3];
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
    // 1.得到文件的总大小（本次请求的文件数据的总大小）
    self.totalSize = response.expectedContentLength;
    
    // 2.确认保存全路径
    self.fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.mp4"];
//    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
    
    // 3.创建一个空的文件
    [[NSFileManager defaultManager] createFileAtPath:self.fullPath contents:nil attributes:nil];
    // 4.创建文件句柄（指针）
    self.handle = [NSFileHandle fileHandleForWritingAtPath:self.fullPath];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 1.偏移文件句柄到文件的末尾
    [self.handle seekToEndOfFile];
    // 2.写数据
    [self.handle writeData:data];
    // 3.获得进度
    self.currentSize += data.length;
    // 下载进度 = 已下载的 / 文件总大小
    NSLog(@"%f", 1.0 * self.currentSize / self.totalSize);
    self.progressView.value = 1.0 * self.currentSize / self.totalSize;
    
    // 4.写数据到沙盒中
    [data writeToFile:self.fullPath atomically:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 1.关闭文件句柄并清空
    [self.handle closeFile];
    self.handle = nil;
    
    NSLog(@"connectionDidFinishLoading");
}
@end
