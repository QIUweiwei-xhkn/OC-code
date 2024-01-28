//
//  ViewController.m
//  02-UILabel的使用
//
//  Created by wei wei on 2023/12/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.1创建UILabel对象
    UILabel *lable = [[UILabel alloc] init];
    
    //1.2设置frame
    lable.frame = CGRectMake(100, 100, 200, 75);
    lable.backgroundColor = [UIColor redColor];
    lable.text = @"HelloWorld!HelloWorld!HelloWorld!HelloWorld!HelloWorld!";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:20.f];
    lable.font = [UIFont boldSystemFontOfSize:25.f];
    lable.font = [UIFont italicSystemFontOfSize:20.f];
    lable.textColor = [UIColor whiteColor];
    //设置阴影（默认有值）
    lable.shadowColor = [UIColor blackColor];
    lable.shadowOffset = CGSizeMake(6, 3);
    
    //设置行数(零是自动换行)
    lable.numberOfLines = 0;
    /*
     NSLineBreakByWordWrapping = 0,         // Wrap at word boundaries, default
     NSLineBreakByCharWrapping,        // Wrap at character boundaries
     NSLineBreakByClipping,        // Simply clip
     NSLineBreakByTruncatingHead,    // Truncate at head of line: "...wxyz"
     NSLineBreakByTruncatingTail,    // Truncate at tail of line: "abcd..."
     NSLineBreakByTruncatingMiddle    // Truncate middle of line:  "ab...yz"
     */
    lable.lineBreakMode = NSLineBreakByTruncatingMiddle;
    // 2.0添加到控制器中的View中
    [self.view addSubview:lable];
}


@end
