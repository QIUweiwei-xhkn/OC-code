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

#pragma mark - 代理方法
// 在这个方法返回之前就要计算cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    QStatusTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    QStatus *status = self.statuses[indexPath.row];
    CGFloat space = 10;
    /** 头像   */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 30;
    CGRect iconImageViewFrame = CGRectMake(iconX, iconY, iconW, iconW);
    
    /** 正文   */
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(iconImageViewFrame) + space;
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
    NSDictionary *textAtt = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    // 最大宽度是 textW ，高度不限制
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
//    CGFloat textH = [self.status.text sizeWithFont:QTextFont constrainedToSize:textSize].height;
    CGFloat textH = [status.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    CGRect text_LableFrame = CGRectMake(textX, textY, textW, textH);
    
    /** 图片   */
    CGFloat cellHeight = 0;
    if(status.picture) {
        CGFloat pictureWH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(text_LableFrame) + space;
        CGRect pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        cellHeight = CGRectGetMaxY(pictureImageViewFrame) + space;
    }else {
        cellHeight = CGRectGetMaxY(text_LableFrame) + space;
    }
    return cellHeight;
}
@end
