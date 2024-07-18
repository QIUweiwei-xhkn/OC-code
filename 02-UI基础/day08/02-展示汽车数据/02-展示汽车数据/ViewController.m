//
//  ViewController.m
//  02-展示汽车数据
//
//  Created by wei wei on 2024/2/27.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *UItableVIew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.UItableVIew.dataSource = self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 5;
    }else if(section == 1) {
        return 4;
    }else if(section == 3) {
        return 3;
    }else
        return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // 设置cell右边显示的控件 优先级 > 设置cell右边的指示样式
//    cell.accessoryView = [[UISwitch alloc] init];
    /* 设置cell右边的指示样式
     UITableViewCellAccessoryNone,
     UITableViewCellAccessoryDisclosureIndicator,
     UITableViewCellAccessoryDetailDisclosureButton,
     UITableViewCellAccessoryCheckmark,
     UITableViewCellAccessoryDetailButton,
     */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"奔驰";
            cell.imageView.image = [UIImage imageNamed:@"0-0"];
        }else if(indexPath.row == 1) {
            cell.textLabel.text = @"宝马";
            cell.imageView.image = [UIImage imageNamed:@"0-1"];
        }else if(indexPath.row == 2) {
            cell.textLabel.text = @"奥迪";
            cell.imageView.image = [UIImage imageNamed:@"0-2"];
        }else if(indexPath.row == 3) {
            cell.textLabel.text = @"保时捷";
            cell.imageView.image = [UIImage imageNamed:@"0-3"];
        }else {
            cell.textLabel.text = @"大众";
            cell.imageView.image = [UIImage imageNamed:@"0-4"];
        }
    }else if(indexPath.section == 1) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"丰田";
            cell.imageView.image = [UIImage imageNamed:@"1-0"];
        }else if(indexPath.row == 1) {
            cell.textLabel.text = @"马自达";
            cell.imageView.image = [UIImage imageNamed:@"1-1"];
        }else if(indexPath.row == 2) {
            cell.textLabel.text = @"本田";
            cell.imageView.image = [UIImage imageNamed:@"1-2"];
        }else {
            cell.textLabel.text = @"日产";
            cell.imageView.image = [UIImage imageNamed:@"1-3"];
        }
    }else if (indexPath.section == 2) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"法拉利";
            cell.imageView.image = [UIImage imageNamed:@"2-0"];
        }else if(indexPath.row == 1) {
            cell.textLabel.text = @"玛莎拉蒂";
            cell.imageView.image = [UIImage imageNamed:@"2-1"];
        }else {
            cell.textLabel.text = @"兰博基尼";
            cell.imageView.image = [UIImage imageNamed:@"2-2"];
        }
    }else{
        if(indexPath.row == 0) {
            cell.textLabel.text = @"比亚迪";
            cell.imageView.image = [UIImage imageNamed:@"3-0"];
        }else if(indexPath.row == 1) {
            cell.textLabel.text = @"瑞麒";
            cell.imageView.image = [UIImage imageNamed:@"3-1"];
        }else {
            cell.textLabel.text = @"奇瑞";
            cell.imageView.image = [UIImage imageNamed:@"3-2"];
        }
    }
    return cell;
}

/**
 *  告诉tableView每一组的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"德系品牌";
    }else if(section == 1) {
        return @"日系品牌";
    }else if(section == 1) {
        return @"意系品牌";
    }
    else {
        return @"天系品牌";
    }
}

/**
 *  告诉tableView每一组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if(section == 0) {
        return @"质量有保障，高端大气上档次";
    }else if(section == 1) {
        return @"性价比高，低碳端首选";
    }else if(section == 1) {
        return @"低调的奢华，高富帅首选";
    }
    else {
        return @"天系自主品牌，可厉害了";
    }
}
@end
