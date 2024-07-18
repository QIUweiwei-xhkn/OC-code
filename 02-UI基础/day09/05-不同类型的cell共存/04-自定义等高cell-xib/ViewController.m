//
//  ViewController.m
//  04-自定义等高cell-xib
//
//  Created by wei wei on 2024/3/6.
//

#import "ViewController.h"
#import "Qtg.h"
#import "MJExtension.h"
#import "QtgTableViewCell.h"
#import "QtextCell.h"

@interface ViewController ()
/** 所有团购数据   */
@property(nonatomic, strong) NSArray *tgs;
@end

@implementation ViewController

- (NSArray *)tgs {
    if(!_tgs) {
        _tgs = [Qtg mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}

NSString *ID = @"tg";
NSString *textID = @"text";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setRowHeight:70];
//    [self.tableView registerClass:[QtgTableViewCell class] forCellReuseIdentifier:ID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QtgTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QtextCell class]) bundle:nil] forCellReuseIdentifier:textID];
}

#pragma mark - 数据源代码
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row % 2 == 0) {
        // 访问缓存池
        QtgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        // 设置数据(传递模型）
        cell.tg = self.tgs[indexPath.row];
        return cell;
    }else {
        QtextCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        return cell;
    }
    
}
@end
