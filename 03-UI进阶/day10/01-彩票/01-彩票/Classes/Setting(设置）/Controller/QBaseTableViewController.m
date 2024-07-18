//
//  QBaseTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/18.
//

#import "QBaseTableViewController.h"

@interface QBaseTableViewController ()

@end

@implementation QBaseTableViewController
- (NSMutableArray *)groupArr {
    if(!_groupArr) {
        _groupArr = [NSMutableArray array];
    }
    return _groupArr;
}

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    QSettingGroup *arr = self.groupArr[section];
    return arr.itemsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QSettingTableViewCell *cell = [QSettingTableViewCell cellWithTableView:tableView ];
    
    // 取出当前组模型
    QSettingGroup *arr = self.groupArr[indexPath.section];
    
    // 取出当前行模型
    QSettingItem *item = arr.itemsArr[indexPath.row];
    cell.item = item;
    return cell;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 取出组模型
    QSettingGroup *group = self.groupArr[section];
    return group.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    // 取出组模型
    QSettingGroup *group = self.groupArr[section];
    return group.footTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 当点击检查版本更新弹框
//    if(indexPath.section == 2 && indexPath.row == 0) {
//        [MBProgressHUD showSuccess:@"没有版本更新"];
//        return;
//    }
    
    // 点击跳转
    // 取出组模型
    QSettingGroup *group = self.groupArr[indexPath.section];
    // 取出行模型
    QSettingItem *item = group.itemsArr[indexPath.row];
    
    // 做事情和转跳只能选一个
    if(item.operationBlock) {
        item.operationBlock(indexPath);
    }else if([item isKindOfClass:[QSettingArrowItem class]]) {
        // 只有箭头模型才能跳转
        QSettingArrowItem *arrowItme = (QSettingArrowItem *)item;
        // 跳转
        if(arrowItme.desVC) {
            // 只有有目标控制器才能跳转
            UIViewController *vc = [[arrowItme.desVC alloc] init];
            vc.navigationItem.title = arrowItme.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
