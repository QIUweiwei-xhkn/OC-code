//
//  ViewController.m
//  01-plist存储
//
//  Created by wei wei on 2024/5/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    // NSUserDefaults它保存的也是一个plist
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"Qww" forKey:@"name"];
    [defaults setInteger:21 forKey:@"age"];
    // 立即写入到文档中
    [defaults synchronize];
    // 保存到了/Users/weiwei/Library/Developer/CoreSimulator/Devices/FF0EFCFB-9715-49B4-AC0A-DD78BFC9862F/data/Containers/Data/Application/F6CA9473-0530-4F4D-A4FF-EEFB182F42DC/Library/Preferences/hh.-1-plist--.plist   中    /Library/Preferences/hh.-1-plist--.plist

    
    // 输出沙盒路径
    NSLog(@"%@", NSHomeDirectory());
}
- (IBAction)read:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *stirng = [defaults objectForKey:@"name"];
    NSLog(@"name == %@", stirng);
    NSInteger age = [defaults integerForKey:@"age"];
    NSLog(@"age == %ld", age); 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
