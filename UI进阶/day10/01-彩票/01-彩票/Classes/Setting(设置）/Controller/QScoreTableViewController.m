//
//  QScoreTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/18.
//

#import "QScoreTableViewController.h"

@interface QScoreTableViewController ()

@end

@implementation QScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
}

- (void)setupGroup0 {
    QSettingSwitchItem *item0 = [QSettingSwitchItem initWithTitle:@"关注比赛"];
    QSettingGroup *group = [QSettingGroup initWithItems:@[item0]];
    [self.groupArr addObject:group];
}

- (void)setupGroup1 {
    QSettingItem *item0 = [QSettingItem initWithTitle:@"起始时间"];
    item0.subTitle = @"00:00";
    QSettingGroup *group = [QSettingGroup initWithItems:@[item0]];
    [self.groupArr addObject:group];
}

- (void)setupGroup2 {
    QSettingItem *item0 = [QSettingItem initWithTitle:@"结束时间"];
    item0.subTitle = @"23:00";
    // 避免block的循环引用
//    __weak typeof(self) weakself = self;
    __unsafe_unretained typeof(self) weakself = self;  // 作用同 __weak
    item0.operationBlock = ^(NSIndexPath *indexPath){
        UITableViewCell *cell = [weakself.tableView cellForRowAtIndexPath:indexPath];
        UITextField *textField = [[UITextField alloc] init];
        [cell addSubview:textField];
        [textField becomeFirstResponder];
    };
    QSettingGroup *group = [QSettingGroup initWithItems:@[item0]];
    [self.groupArr addObject:group];
}
@end
