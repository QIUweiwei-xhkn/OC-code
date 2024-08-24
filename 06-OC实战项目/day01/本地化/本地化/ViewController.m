//
//  ViewController.m
//  本地化
//
//  Created by wei wei on 2024/8/23.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myBtn;

@end

@implementation ViewController

// genstrings指令的作用：自动生成strings文件

- (void)viewDidLoad {
    [super viewDidLoad];
    //    NSAttributedString *title = [[NSBundle mainBundle] localizedAttributedStringForKey:@"Cancel" value:nil table:@"Test"];
    //    NSAttributedString *title = NSLocalizedAttributedStringFromTable(@"Cancel", @"Test", nil);
    //    [self.myBtn setTitle:title.string forState:UIControlStateNormal];
        
    //    NSString *title = NSLocalizedStringFromTable(@"Cancel", @"Test", nil);
    //    NSString *title = [[NSBundle mainBundle] localizedStringForKey:@"Cancel" value:nil table:@"Test"];
    //    NSLog(@"%@", title);
    //    [self.myBtn setTitle:title  forState:UIControlStateNormal];
    
    // 如果字符串文件名是空的，就会去加载Localizable.strings文件
    
    [self.myBtn  setTitle:NSLocalizedStringFromTable(@"Cancle", @"Text2", @"A title on cancel Btn") forState:UIControlStateNormal];
    
    NSString *string1 = NSLocalizedStringFromTable(@"Done", @"Text2", @"A title on done Btn");
    
    NSString *string2 = NSLocalizedString(@"Go", @"Run run run");
}


@end
