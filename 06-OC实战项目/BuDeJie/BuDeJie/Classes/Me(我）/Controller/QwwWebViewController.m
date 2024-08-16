//
//  QwwWebViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/15.
//

#import "QwwWebViewController.h"
#import <WebKit/WebKit.h>

@interface QwwWebViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardBtn;
@property(nonatomic, weak) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@end

@implementation QwwWebViewController
- (IBAction)goForward:(id)sender {
    [self.webView goForward];
}
- (IBAction)goBack:(id)sender {
    [self.webView goBack];
}
- (IBAction)refresh:(id)sender {
    [self.webView reload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加webView
    WKWebView *webView = [[WKWebView alloc] init];
    _webView = webView;
    [self.contentView  addSubview:webView];
    
    // 展示网页
    NSURLRequest *request = [NSURLRequest requestWithURL:_url ];
    [webView loadRequest:request];
    
    // KVC监听属性改变
    /*
     Observer：观察者
     KeyPath：观察webView哪个属性
     options:NSKeyValueObservingOptionNew：观察新值改变
     KVO注意点.一定要记得移除
     */
    [webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

// 只要观察的对象有新值的时候调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.backBtn.enabled = self.webView.canGoBack;
    self.forwardBtn.enabled = self.webView.canGoForward;
    self.title = self.webView.title; 
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
    
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"canGoBack" ];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _webView.frame = _contentView.frame;
}

@end
