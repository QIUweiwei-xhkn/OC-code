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
/** 记录用户选中行的索引   */
@property(nonatomic, strong) NSMutableArray *selectedIndexPath;
@end

@implementation ViewController
- (NSMutableArray *)wineArray {
    if(!_wineArray) {
        _wineArray = [QWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}

- (NSMutableArray *)selectedIndexPath {
    if(!_selectedIndexPath) {
        _selectedIndexPath = [NSMutableArray array];
    }
    return _selectedIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.allowsMultipleSelection = YES;
    
    
}
#pragma mark - 按钮的点击

- (IBAction)remove {
    // 获取要删除的酒模型
//    NSMutableArray *deleteWineArray = [NSMutableArray array];
//    for (QWine *wine in self.wineArray) {
//        if(wine.isChecked) {
//            [deleteWineArray addObject:wine];
//        }
//    }
//    // 修改模型
//    [self.wineArray removeObjectsInArray:deleteWineArray];
//    // 刷新表格
//    [self.tableView reloadData];
    
    NSMutableArray *deleteWineArray = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.selectedIndexPath) {
        [deleteWineArray addObject:self.wineArray[indexPath.row]];
    }
    // 修改模型
    [self.wineArray removeObjectsInArray:deleteWineArray];
    // 刷新表格
    [self.tableView deleteRowsAtIndexPaths:self.selectedIndexPath withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.selectedIndexPath removeAllObjects];

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    QWineCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.checkImageView.hidden = !cell.checkImageView.isHidden;
    
    QWine *wine = self.wineArray[indexPath.row];
//    wine.check = !wine.isChecked;
    if(wine.isChecked) { // 之前是打勾的，取消打勾
        wine.check = NO;
        [self.selectedIndexPath removeObject:indexPath];
    }else { // 之前不是打勾的，打勾
        wine.check = YES;
        [self.selectedIndexPath addObject:indexPath];
    }
    
//    [self.tableView reloadData];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
