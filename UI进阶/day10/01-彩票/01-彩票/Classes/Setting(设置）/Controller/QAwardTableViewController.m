//
//  QAwardTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/18.
//

#import "QAwardTableViewController.h"

@interface QAwardTableViewController ()

@end

@implementation QAwardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup];
}

- (void)setupGroup {
    QSettingSwitchItem *item0 = [QSettingSwitchItem initWithTitle:@"双色球"];
    item0.subTitle = @"每天开奖";
    QSettingSwitchItem *item1 = [QSettingSwitchItem initWithTitle:@"双色球"];
    item1.subTitle = @"每天开奖";
    QSettingSwitchItem *item2 = [QSettingSwitchItem initWithTitle:@"双色球"];
    item2.subTitle = @"每天开奖";
    QSettingSwitchItem *item3 = [QSettingSwitchItem initWithTitle:@"双色球"];
    item3.subTitle = @"每天开奖";
    QSettingSwitchItem *item4 = [QSettingSwitchItem initWithTitle:@"双色球"];
    item4.subTitle = @"每天开奖";
    QSettingSwitchItem *item5 = [QSettingSwitchItem initWithTitle:@"双色球"];
    item5.subTitle = @"每天开奖";

    QSettingGroup *group = [QSettingGroup initWithItems:@[item0, item1, item2, item3, item4, item5]];
    [self.groupArr addObject:group];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"cell";
//    QSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell==nil) {
//        cell = [[QSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    QSettingTableViewCell *cell = [QSettingTableViewCell cellWithTableView:tableView ];
    
    QSettingTableViewCell *cell = [QSettingTableViewCell cellWithTableView:tableView cellStyle:UITableViewCellStyleSubtitle]; 
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    
    // 取出当前组模型
    QSettingGroup *arr = self.groupArr[indexPath.section];
    
    // 取出当前行模型
    QSettingItem *item = arr.itemsArr[indexPath.row];
    cell.item = item;
    return cell;
}
@end
