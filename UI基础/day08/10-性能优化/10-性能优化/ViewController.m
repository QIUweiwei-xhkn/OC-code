//
//  ViewController.m
//  10-性能优化
//
//  Created by wei wei on 2024/3/2.
//

#import "ViewController.h"
NSString *ID = @"wine";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    // 根据 ID 这个标识 注册对应的cell类型 为UITableViewCell
    // 只需要注册一次， 且要在去缓存池取cell之前
    // 缺点：无法改变系统创建的UItableViewdCell的显示样式，更适用于自定义控件
    [self.tableView registerClass:[UITableView class] forCellReuseIdentifier:ID];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}

/**
 *  每当一个cell进入视野就会调用一次
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 0.定一个重用标识 （static 只改变生命周期，不改变作用域）
//    static NSString *ID = @"wine";
    /*
     UITableViewCell *cell = [[UITableViewCell alloc] init];
     cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据", indexPath.row];
     NSLog(@"cellForRowAtIndexPath----%ld---%p", indexPath.row, cell);
     */

    
    // 1.去缓存池里取是否有可以循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池里没有可以循环利用的cell，自己创建
//    if(cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        // 统一样式可以设置在这个判断里，减少每次进入cellForRowAtIndexPath后都要新建新对象 例如设置背景颜色 cell.backgroundColor = [UIColor redColor];
//    }
    
    // 3.设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据", indexPath.row];
//    NSLog(@"cellForRowAtIndexPath----%ld---%p", indexPath.row, cell);
    
    // 有if 就要对应一个else 覆盖缓存池里cell的样式，避免出现不符合预期的效果
    if( indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
@end
