//
//  ViewController.m
//  01-颜色常识
//
//  Created by wei wei on 2024/8/7.
//

#import "ViewController.h"
#import "UIColor+Hex.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Lable;

@end

#define QColor(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     颜色：3种颜色通道 R G B
     颜色表达方式
     24位
     32位
     每一个颜色通道是8位，0~256
     R:213 G:213 B:213
     #ffffff
     R:FF => 10进制 255
     G: FF 255
     B: FF 255
     #：美工16进制表示形式
     0x:OC16进制表达式
     */
    
//    UIColor *color = [UIColor colorWithRed:213 / 255.0 green:213 / 255.0 blue:213 / 255.0 alpha:1];
//    _Lable.textColor = color;
 
//    _Lable.textColor = QColor(213, 213, 213);
    
//    UIColor *color = [UIColor colorWithHexString:@"#eb3535"];
    UIColor *color = [UIColor colorWithHexString:@"eb3535"];
    _Lable.textColor = color;
    
}


@end
