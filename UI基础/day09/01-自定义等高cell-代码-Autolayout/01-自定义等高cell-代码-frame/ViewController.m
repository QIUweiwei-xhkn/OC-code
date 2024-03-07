//
//  ViewController.m
//  01-自定义等高cell-代码-frame
//
//  Created by wei wei on 2024/3/5.
//

#import "ViewController.h"
#import "QtgTableViewCell.h"
#import "Qtg.h"

@interface ViewController ()
/** 所有团购数据   */
@property(nonatomic, strong) NSArray *tgs;
@end

@implementation ViewController

- (NSArray *)tgs {
    if(!_tgs) {
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil] ];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *tgDict in dictArr) {
            [temp addObject:[Qtg tgWithDict:tgDict]];
        }
        _tgs = temp;
    }
    return _tgs;
}

NSString *ID = @"tg";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[QtgTableViewCell class] forCellReuseIdentifier:ID];
    [self.tableView setRowHeight:70];
}

#pragma mark - 数据源代码
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"tg";
    
    // 访问缓存池
    QtgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 设置数据(传递模型）
    cell.tg = self.tgs[indexPath.row];
    return cell;
}
@end
