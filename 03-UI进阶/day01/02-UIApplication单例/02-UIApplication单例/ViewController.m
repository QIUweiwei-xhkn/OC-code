//
//  ViewController.m
//  02-UIApplication单例
//
//  Created by wei wei on 2024/4/21.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSLog(@"%s",__func__);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIApplication *app1 = [UIApplication sharedApplication];
    UIApplication *app2 = [UIApplication sharedApplication];
    NSLog(@"%p________%p", app1, app2);
//    UIApplication *app3 = [[UIApplication alloc]  init]; //'There can only be one UIApplication instance.'
    
    Person *p1 = [Person sharePerson];
    Person *p2 = [Person sharePerson];
    NSLog(@"%p________%p",p1, p2);
    Person *p3 = [[Person alloc] init];
}


@end
