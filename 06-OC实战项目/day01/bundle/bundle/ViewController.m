//
//  ViewController.m
//  bundle
//
//  Created by wei wei on 2024/8/16.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 方法一
    UIImage *image = [UIImage imageNamed:@"MyText/123"];
    NSLog(@"%@", image);
    
    // 方法二
    NSString *file = [[NSBundle mainBundle] pathForResource:@"MyText.bundle/123" ofType:@"png"];
    UIImage *image1 = [UIImage imageWithContentsOfFile:file];
    
    
    // 方法三
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MyText" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSString *file2 = [bundle pathForResource:@"123" ofType:@"png"];
    UIImage *image2 = [UIImage imageWithContentsOfFile:file2];
    
    NSLog(@"    file%@ \n   file2%@", file ,file2);
    NSLog(@"    image1:%@\n     image2:%@",image1, image2);
    
//    NSLog(@"%@", [NSBundle mainBundle].bundlePath);
    
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MyText" withExtension:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithURL:url];
//    NSLog(@"%@", bundle);
    
//    UIView *textView = [[[NSBundle bundleWithURL:url] loadNibNamed:@"TextView" owner:nil options:nil] firstObject];
//    [self.view addSubview:textView];
}


@end
