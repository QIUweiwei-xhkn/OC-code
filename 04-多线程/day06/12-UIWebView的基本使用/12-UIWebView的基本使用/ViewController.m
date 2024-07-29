//
//  ViewController.m
//  12-UIWebView的基本使用
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test5];
}

- (void)test {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //加载网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)test2 {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //加载网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

// 加载本地资源
- (void)test3 {
    //    NSURL *url = [NSURL fileURLWithPath:@"/Users/weiwei/Desktop/1.png"];
    NSURL *url = [NSURL fileURLWithPath:@"/Users/weiwei/Desktop/123.mp4"];
    //加载网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)test4 {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //加载网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    // 设置网页自适应
    self.webView.scalesPageToFit = YES;
}

- (void)test5 {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"text.html" withExtension:nil];
    //加载网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.webView.dataDetectorTypes =  UIDataDetectorTypeAll;
}

@end
