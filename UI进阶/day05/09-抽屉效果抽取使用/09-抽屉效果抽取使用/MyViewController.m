//
//  MyViewController.m
//  09-抽屉效果抽取使用
//
//  Created by wei wei on 2024/7/8.
//

#import "MyViewController.h"
#import "MyTableViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 当一个控制器的View添加到另一个控制器的View上的时候，那此时View所在的控制器也应该成为上一个控制器的子控制器
    MyTableViewController *tableVC1 = [[MyTableViewController alloc] init];
    tableVC1.view.frame = self.mainV.bounds;
    [self.mainV addSubview:tableVC1.view];
    [self addChildViewController:tableVC1];
    
    MyTableViewController *tableVC2 = [[MyTableViewController alloc] init];
    tableVC2.view.frame = self.leftV.bounds;
    tableVC2.view.backgroundColor = [UIColor redColor];
    [self.leftV addSubview:tableVC2.view];
    [self addChildViewController:tableVC2];
    
}


@end
