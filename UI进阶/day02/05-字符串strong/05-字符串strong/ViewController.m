//
//  ViewController.m
//  05-字符串strong
//
//  Created by wei wei on 2024/5/14.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不可变字符
//    NSString *name = @"Qww";  // 0x1042301e8----0x1042301e8
    
    NSMutableString *name = [NSMutableString stringWithFormat:@"Qww"]; // 0x600000c01b90----0xb216638303768702s
    Person *p1 = [[Person alloc] init];
    p1.name = name;
    NSLog(@"%p----%p", name, p1.name);
}


@end
