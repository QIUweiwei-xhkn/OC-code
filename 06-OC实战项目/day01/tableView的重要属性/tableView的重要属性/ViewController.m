//
//  ViewController.m
//  tableView的重要属性
//
//  Created by wei wei on 2024/8/17.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

/*
     什么是内容？内容包括什么？
     1.cell
     2.tableHeaderView\tableFooterView
     3.sectionHeader\sectionFooter
     contentSize.height：所有内容的总高度
     contentInset：在内容周围额外增加的间距（内边距），始终粘着内容
     contentOffset：内容距离frame矩形框，偏移了多少
     frame：是以父控件内容的左上角为坐标原点｛0，0｝bounds ：是以自己内容的左上角为坐标原点｛0，0｝
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(50, 100, 200, 400);
    tableView.backgroundColor = [UIColor grayColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    tableView.contentInset = UIEdgeInsetsMake(100, 0, 49, 0);
    
//    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 64)];
//    tableView.tableHeaderView.backgroundColor = [UIColor yellowColor];
//    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 49)];
//    tableView.tableFooterView.backgroundColor = [UIColor yellowColor];
    
    UIView *header = [[UIView alloc] init];
    header.frame = CGRectMake(0, -64, tableView.frame.size.width, 64);
    header.backgroundColor = [UIColor blueColor];
    [tableView addSubview:header];
    
    
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, -- %zd",[self class], indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"contentSize height %f", tableView.contentSize.height);
    NSLog(@"contentOffset y -- %f", tableView.contentOffset.y);
}
@end
