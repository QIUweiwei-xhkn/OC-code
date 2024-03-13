//
//  ViewController.m
//  07-自定义不等高cell
//
//  Created by wei wei on 2024/3/13.
//

#import "ViewController.h"
#import "QStatus.h"
#import "MJExtension.h"
#import "QStatusTableViewCell.h"

@interface ViewController ()
/** 所有的微博数据   */
@property(nonatomic, strong) NSArray *statuses;
@end

@implementation ViewController

- (NSArray *)statuses {
    if(_statuses) {
        _statuses = [QStatus mj_objectArrayWithFilename:@"statuses.plist"]; 
    }
    NSLog(@"%@",_statuses);
    return _statuses;
}

NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 150;
    [self.tableView registerClass:[QStatusTableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 访问缓存池
    QStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 传模型数据
    cell.status = self.statuses[indexPath.row];
    return cell;
}
@end
