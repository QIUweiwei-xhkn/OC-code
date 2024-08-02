//
//  ViewController.m
//  02-IOS9新特性之__kindof
//
//  Created by wei wei on 2024/7/31.
//

#import "ViewController.h"
#import "SubPerson.h"

@interface ViewController ()

@end

@implementation ViewController
/*
     kindof：相当于
     _kindof：表示当前类或者它的子类‘
     类设计历史
     id：可以调用任何对象方法，不能进行编译检查
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    SubPerson *subPerson = [SubPerson person];
}


@end
