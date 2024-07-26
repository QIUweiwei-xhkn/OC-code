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

/** 输出流   */
@property(nonatomic, strong) NSOutputStream *outputStream;

/** <#注释#>   */
@property(nonatomic, strong) NSURLConnection *connection;
@end

@implementation ViewController
- (IBAction)startBtnClick:(id)sender {
    NSLog(@"开始下载");
    // 下载视频
    NSURL *url = [ NSURL URLWithString:@"https://699pic.com/tupian-501626119.html"];
    // 2.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 设置请求头
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.currentSize];
    [request setValue:range forHTTPHeaderField:@"Range"] ;
    
    // 3.发送请求设置代理
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (IBAction)cancelBtnClick:(id)sender {
    NSLog(@"取消下载");
    [self.connection cancel];
}

- (IBAction)continueBtnClicl:(id)sender {
    // 下载视频
    NSURL *url = [ NSURL URLWithString:@"https://699pic.com/tupian-501626119.html"];
    // 2.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 设置请求头
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.currentSize];
    [request setValue:range forHTTPHeaderField:@"Range"] ;
    
    // 3.发送请求设置代理
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if(self.currentSize > 0) {
        return;
    }
    NSLog(@"didReceiveResponse");
//    NSLog(@"%lld", response.expectedContentLength);
    // 1.得到文件的总大小（本次请求的文件数据的总大小）（本次请求的文件数据的总大小 ！= 文件的总大小） 
    self.totalSize = response.expectedContentLength;
    
    // 2.确认保存全路径
    self.fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.jpg"];
    
    // 3.创建输出数据流
    /*
     第一个参数：文件的路径
     第二个参数：是否追加， YES追加
     特点：如果该输出流指向的地址没有文件，那么会自动创建一个空的文件
     */
    self.outputStream = [[NSOutputStream alloc] initToFileAtPath:self.fullPath append:YES];
    
    // 4.打开输出流
    [self.outputStream open];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 写数据
    [self.outputStream write:data.bytes maxLength:data.length];
    
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
    // 1.关闭数据流柄并清空
    [self.outputStream close];
    self.outputStream = nil;
    
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"%@", self.fullPath);
}



@end
