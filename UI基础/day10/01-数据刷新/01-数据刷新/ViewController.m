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

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 酒数据   */
@property(nonatomic, strong) NSMutableArray *wineArray;
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
    
}
#pragma mark - 按钮的点击
- (IBAction)add {
    // 修改模型
    QWine *wine = [[QWine alloc] init];
    wine.image = @"nverhong";
    wine.money = @"55.6";
    wine.name = @"女儿红";
    
//    [self.wineArray addObject:wine];
    [self.wineArray insertObject:wine atIndex:0];
    
    // 告诉tableView数据变了，赶紧更新
    // 全局更新
//    [self.tableView reloadData];
    
    // 局部更新
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationRight];
}

- (IBAction)remove {
    // 修改模型
    [self.wineArray removeObjectAtIndex:0];
    // 更新数据
    // 全局更新
//    [self.tableView reloadData];
    
    // 局部更新
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}

- (IBAction)update {
    // 修改模型
    QWine *wine = self.wineArray[0];
    wine.money = @"100";
    
    QWine *wine2 = self.wineArray[1];
    wine2.name = @"哈哈";
    // 更新数据
    // 全局刷新
//    [self.tableView reloadData];
    
    // 局部刷新
    NSArray *indexPaths = @[
        [NSIndexPath indexPathForRow:0 inSection:0],
        [NSIndexPath indexPathForRow:1 inSection:0]
    ];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
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
@end
