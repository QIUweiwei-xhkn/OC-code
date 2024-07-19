//
//  ViewController.m
//  08-GCD线程之间的通讯
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // https://i2.hdslb.com/bfs/archive/793e8b205eea44661fbbe16ba5da86a5bf0bf169.jpg
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@", [NSThread currentThread]);
        // 1.创建URL
        NSURL *url = [NSURL URLWithString:@"https://i2.hdslb.com/bfs/archive/793e8b205eea44661fbbe16ba5da86a5bf0bf169.jpg"];
        
        // 2.异步的网络 API，URLSession
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error && data) {
                UIImage *image = [UIImage imageWithData:data];
                // 回到主线程执行UI
                dispatch_sync(dispatch_get_main_queue(), ^{
                    NSLog(@"%@", [NSThread currentThread]);
                    self.imageView.image = image;
                });
            } else {
                NSLog(@"图片加载失败");
            }
        }] resume];
    });
}


@end
