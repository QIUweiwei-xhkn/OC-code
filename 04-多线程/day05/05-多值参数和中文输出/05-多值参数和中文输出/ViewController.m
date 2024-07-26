//
//  ViewController.m
//  05-多值参数和中文输出
//
//  Created by wei wei on 2024/7/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //1.url
    //正确写法：http://120.25.226,186:32812/weather7place=Beijing&place=Guangzhou
    //错误写法：http://120.25.226.186:32812/weather7place=Beijing&Guangzhou
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/weather?place=Beijing&place=Guangzhou"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError) {
            return;
        }
        // 解析：
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@", dict);
    }];
}


@end
