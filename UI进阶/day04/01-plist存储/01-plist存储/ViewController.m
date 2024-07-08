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
    NSArray *dataArray = @[@"Qww",@21];
    // 第一个参数是：搜索的路径
    // 第二个参数是：搜索的范围
    // 第三个参数是：是否展开路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",path);
    
    // 拼接文件名
//    NSString *filePath = [path stringByAppendingString:@"data.plist"];
//    NSLog(@"%@",filePath); // ~/Documentsdata.plist
     // 自动拼接文件路径
    NSString *filePath = [path stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@",filePath); // ~/Documents/data.plist
    
    //路径是沙盒路径
    [dataArray writeToFile:filePath  atomically:YES];
}
- (IBAction)read:(id)sender {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"data.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",array);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
