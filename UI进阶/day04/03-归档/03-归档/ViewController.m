//
//  ViewController.m
//  03-归档
//
//  Created by wei wei on 2024/5/26.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    // plist 文档不能存储自定义对象
    Person *per = [[Person alloc] init];
    per.name = @"Qww";
    per.age = 20;
    
    // 归档
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"%@", tempPath);
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"Person.data"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:per requiringSecureCoding:YES error:nil];
    BOOL result = [data writeToFile:filePath options:0 error:nil];
    if(result) {
        NSLog(@"归档成功");
    }else
        NSLog(@"归档失败");
    
}
- (IBAction)read:(id)sender {
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"%@", tempPath);
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"Person.data"];
    NSData *data = [NSData dataWithContentsOfFile:filePath options:0 error:nil];
    Person *per = [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:data error:nil];
    
    NSLog(@"%@", per);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
