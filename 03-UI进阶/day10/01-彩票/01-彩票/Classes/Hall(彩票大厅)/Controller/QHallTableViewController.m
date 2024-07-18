 //
//  QHallTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "QHallTableViewController.h"
#import "QCover.h"
#import "QPopMenu.h"


#define QkeyWindow [UIApplication sharedApplication].keyWindow

@interface QHallTableViewController () <QPopMenuDelegate>

@end

@implementation QHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 在IOS7 之后导航条上图片，默认被渲染
    
    // 1.设置导航条左侧按钮
    UIImage *image = [UIImage imageWithRenderOriginalName:@"hall_1"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonOnClick)];
}

- (void)leftButtonOnClick {
//    NSLog(@"%s -- line %d", __func__, __LINE__);
//    UIView *cover = [[UIView alloc] init];
//    UIAlertView *alert = [[UIAlertView alloc] init];
//    [alert show];
    // 1.弹出蒙版，占据整个屏幕，不允许与用户交互
    [QCover show];
    // 2.popMenu
    QPopMenu *popMenu = [QPopMenu showInCenter:self.view.center];
    popMenu.delegate = self;
    
    // 设置popMenu的frame
//    NSLog(@"%@",NSStringFromCGRect(popMenu.frame));
//    CGRect frame = popMenu.frame;
//    frame.size.width = 10;
//    popMenu.frame = frame;
    
    popMenu.width = 100;
    popMenu.height = 100;
    popMenu.x = 50;
    popMenu.y = 50;
//    NSLog(@"%f", popMenu.width);
//    NSLog(@"%@",NSStringFromCGRect(popMenu.frame));
}


- (void)popMenuDidCloseBtn:(QPopMenu *)popMenu {
//    NSLog(@"%s -- line %d", __func__, __LINE__);
    // 隐藏popMenu
//    [popMenu hideInCenter:CGPointMake(44, 44)];
//    [UIView animateWithDuration:0 animations:^{
//        
//    }];
    
    void(^completion)(BOOL) = ^(BOOL value) {
        // 移除蒙版
        [QCover hide];
    };
    // 动画结束的时候移除蒙版
    [popMenu hideInCenter:CGPointMake(44, 44) completion:completion];
    
}
 
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
