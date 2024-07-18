//
//  QSettingTableViewCell.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QSettingTableViewCell.h"
@implementation QSettingTableViewCell
- (void)setItem:(QSettingItem *)item {
    _item = item;
    // 设置数据
    self.imageView.image = item.icon;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    //    // 搭建界面
    //    if(indexPath.section == 0) {
    //        // 第一组
    //        if(indexPath.row == 0) {
    //            // 第一行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"使用兑换码";
    //        }
    //    }else if(indexPath.section == 1) {
    //        // 第二组
    //        if(indexPath.row == 0) {
    //            // 第一行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"推送和提醒";
    //        }else if(indexPath.row == 1) {
    //            // 第二行
    //            cell.imageView.image = [UIImage imageNamed:@"handShake"];
    //            cell.textLabel.text = @"使用摇一摇机选";
    //        }else if(indexPath.row == 2) {
    //            // 第三行
    //            cell.imageView.image = [UIImage imageNamed:@"sound_Effect"];
    //            cell.textLabel.text = @"声音效果";
    //        }else if(indexPath.row == 3) {
    //            // 第四行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"购彩小助手";
    //        }
    //    }else if(indexPath.section == 2) {
    //        // 第三组
    //        if(indexPath.row == 0) {
    //            // 第一行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"检查新版本";
    //        }else if(indexPath.row == 1) {
    //            // 第二行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"分享";
    //        }else if(indexPath.row == 2) {
    //            // 第三行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"产品推荐";
    //        }else if(indexPath.row == 3) {
    //            // 第四行
    //            cell.imageView.image = [UIImage imageNamed:@"RedeenCode"];
    //            cell.textLabel.text = @"关于";
    //        }
    //    }
  
    // 设置右侧视图
    [self setupRightView];
}

// 设置右侧视图
- (void)setupRightView {
    if ([self.item isKindOfClass:[QSettingArrowItem class]]) {
        // 右侧的视图为箭头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    }else if([self.item isKindOfClass:[QSettingSwitchItem class]]) {
        UISwitch *sw = [[UISwitch alloc] init];
        sw.on = self.item.on;
        self.accessoryView = sw;
    }else {
        self.accessoryView = nil;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)cellStyle{
    static NSString *ID = @"cell";
    QSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil) {
        cell = [[QSettingTableViewCell alloc] initWithStyle:cellStyle  reuseIdentifier:ID];
    }
    return cell;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
   return [self cellWithTableView:tableView cellStyle:UITableViewCellStyleValue1];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
