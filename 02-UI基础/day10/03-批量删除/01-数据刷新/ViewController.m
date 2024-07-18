//
//  ViewController.m
//  01-数据刷新
//
//  Created by wei wei on 2024/3/25.
//

#import "ViewController.h"
#import "QWineCell.h"
#import "MJExtension.h"
#import "QWine.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 酒数据   */
@property(nonatomic, strong) NSMutableArray *wineArray;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@end

@implementation ViewController
- (NSMutableArray *)wineArray {
    if(!_wineArray) {
        _wineArray = [QWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.allowsMultipleSelection = YES;
    
    // 告诉tableView在编辑模式下可以多选
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    self.deleteButton.hidden = YES;
}
#pragma mark - 按钮的点击

- (IBAction)multipulRemove {
    //    进入编辑模式
    //    self.tableView.editing = !self.tableView.isEditing;
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    self.deleteButton.hidden = !self.tableView.isEditing;
}
- (IBAction)remove {
    // 千万不要一边遍历一边删除，因为每删除一个元素，其他元素的索引也可能发生变化
    NSMutableArray *deleteWine = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.tableView.indexPathsForSelectedRows) {
//        [self.wineArray removeObjectAtIndex:indexPath.row];
        [deleteWine addObject:self.wineArray[indexPath.row]];
    }
    // 修改模型
    [self.wineArray removeObjectsInArray:deleteWine];
    // 刷新表格
//    [self.tableView reloadData];
    [self.tableView deleteRowsAtIndexPaths:self.tableView.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.wineArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"wine";
    QWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil) {
        cell = [[QWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
/**
 *  只要实现这个方法就，拥有了左划删除的功能
 *   点击左划出现的delete按钮也会调用这个方法
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.wineArray removeObjectAtIndex:indexPath.row];
//    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}

/**
 *  修改默认的Delete按钮文字
 */
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath  {
    return @"删除";
//    return [NSString stringWithFormat:@"删除---%zd", indexPath.row];
}

/**
 *  左划出现什么（几个）按钮
 */
//-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"点击了关注按钮");
//    }];
//
//    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"点击了删除按钮");
//        [self.wineArray removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//    }];
//    action.backgroundColor = [UIColor orangeColor];
//    action2.backgroundColor = [UIColor redColor];
//    return @[action2, action];
//}
@end
