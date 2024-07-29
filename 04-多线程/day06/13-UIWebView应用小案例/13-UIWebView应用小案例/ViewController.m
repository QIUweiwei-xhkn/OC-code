//
//  ViewController.m
//  13-UIWebView应用小案例
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goback;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goforward;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    [self.imageView loadRequest:[NSURLRequest requestWithURL:url]];
    
    // 设置代理
    self.imageView.delegate = self;
}

- (IBAction)gobackItemClick:(id)sender {
    [self.imageView goBack];
}
- (IBAction)goforwardItemClick:(id)sender {
    [self.imageView goForward];
}
- (IBAction)refreshItemClick:(id)sender {
    [self.imageView reload];
}


#pragma mark - UIWebViewDelegate
// 即将加载某个请求的时候调用
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@", request.URL.absoluteString);
    NSString *strM = request.URL.absoluteString;
    if([strM containsString:@"image"]) {
        return NO;
    }
    
    return YES;
}

// 开始加载网页时调用
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
}

// 网页加载完成时调用
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
    self.goback.enabled = self.imageView.canGoBack;
    self.goforward.enabled = self.imageView.canGoForward;
}

// 网页加载失败时调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%s",__func__);
}


@end
