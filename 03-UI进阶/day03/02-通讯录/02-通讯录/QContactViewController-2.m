//
//  QContactViewController-2.m
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import "QContactViewController-2.h"
#import "QAddContactViewController-3.h"
#import "QEidtViewController-4.h"
#import "QAccountItem.h"

@interface QContactViewController_2 () <QAddContactViewControllerDelegate>
/** 存放的都是QAccountItem模型·   */
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation QContactViewController_2
- (NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray ;
}
- (void)setAccountItem:(QAccountItem *)accountItem {
    _accountItem = accountItem;
    NSLog(@"%@--%@",accountItem.name, accountItem.phone);
    
}
- (void)setAccountName:(NSString *)AccountName {
    _AccountName = AccountName;
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录", AccountName];
}
//  退出登入
- (IBAction)loginOut:(id)sender {
    // 1.创建控制器
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"确定要退出吗？" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    // 2.创建按钮
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确定");
        [self.navigationController  popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    // 3.添加按钮
    [alertC addAction:action];
    [alertC addAction:action1];
    // 4.显示弹框（相当于show）
    [self presentViewController:alertC animated:YES completion:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass:[QAddContactViewController_3 class]]) {
        QAddContactViewController_3 *addVC = (QAddContactViewController_3 *)segue.destinationViewController;
    //    addVC.contactVC = self;
        addVC.delegate = self; 
    }else {
        QEidtViewController_4  *editVC = (QEidtViewController_4 *)segue.destinationViewController;
        // 把当前选中的行模型传递给编辑控制器
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        editVC.accountTitem = self.dataArray[indexPath.row]; 
    }

} 



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - QAddContactViewControllerDelegate
 - (void)addContactVC:(QAddContactViewController_3 *)addContactVC accountItem:(QAccountItem *)accountItem {
     // 保存存放的数组中
    [self.dataArray addObject:accountItem];
    NSLog(@"%@--%@",accountItem.name, accountItem.phone);
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//     
    //  取出当前模型
    QAccountItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.phone; 
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
