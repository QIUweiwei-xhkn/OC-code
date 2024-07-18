//
//  QDiscoverTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "QDiscoverTableViewController.h"

@interface QDiscoverTableViewController ()

@end

@implementation QDiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 刷新
    [self.tableView reloadData];
}

// cell将要显示的时候调用
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // cell将要显示的时候做向左划的动画
    // 1.将cell平移出屏幕外
    cell.transform = CGAffineTransformMakeTranslation(self.view.width, 0);
    // 2.让cell复位
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}
@end
