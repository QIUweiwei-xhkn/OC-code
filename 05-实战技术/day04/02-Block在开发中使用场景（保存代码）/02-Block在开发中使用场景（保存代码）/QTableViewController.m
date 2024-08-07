//
//  QTableViewController.m
//  02-Block在开发中使用场景（保存代码）
//
//  Created by wei wei on 2024/8/6.
//

#import "QTableViewController.h"
#import "QCellItem.h"

@interface QTableViewController ()
/** <#注释#>   */
@property(nonatomic, strong) NSArray *cellArr;
@end

@implementation QTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置三个cell，打电话， 发短信，打视频
    QCellItem *cell1 = [QCellItem cellInitWithTitle:@"打电话"];
    cell1.block = ^ {
        NSLog(@"打电话");
    };
    QCellItem *cell2 = [QCellItem cellInitWithTitle:@"发短信"];
    cell2.block = ^ {
        NSLog(@"发短信");
    };
    QCellItem *cell3 = [QCellItem cellInitWithTitle:@"打视频"];
    cell3.block = ^ {
        NSLog(@"打视频");
    };
    _cellArr = @[cell1, cell2, cell3];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID =@"cell";
    // 从缓存池中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
//    if(indexPath.row == 0) {
//        cell.textLabel.text = @"123";
//    }else if(indexPath.row == 1) {
//        
//    }else if(indexPath.row == 2) {
//
//    }
    QCellItem *cellItem = _cellArr[indexPath.row];
    cell.textLabel.text = cellItem.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QCellItem *cellItem = _cellArr[indexPath.row];
    cellItem.block();
}
@end
