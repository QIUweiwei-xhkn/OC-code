//
//  QTableViewController.m
//  12-多图下载综合案例1
//
//  Created by wei wei on 2024/7/20.
//

#import "QTableViewController.h"
#import "QappsItem.h"

@interface QTableViewController ()
/**  tableView的数据源   */
@property(nonatomic, strong) NSArray *apps;
/** 内存资源   */
@property(nonatomic, strong) NSMutableDictionary *images;

/** 队列   */
@property(nonatomic, strong) NSOperationQueue *queue;

/** 操作缓存   */
@property(nonatomic, strong) NSMutableDictionary *operations ;

@end

@implementation QTableViewController
- (void)didReceiveMemoryWarning {
    [self.images removeAllObjects];
    // 取消当前队列中的所有的操作
    [self.queue cancelAllOperations];
}

- (NSOperationQueue *)queue {
    if(_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 4;
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSMutableDictionary *)operations {
    if(_operations == nil) {
        _operations = [[NSMutableDictionary alloc] init];
    }
    return _operations;
}

- (NSMutableDictionary *)images {
    if(_images == nil) {
        _images = [[NSMutableDictionary alloc] init];
    }
    return _images;
}

- (NSArray *)apps {
    if(_apps == nil) {
        // 字典数组
        NSArray *arrM = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        // 字典数组 -------> 模型数组
        NSMutableArray *itemarr = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arrM) {
            [itemarr addObject:[QappsItem appWithDict:dict]];
        }
        _apps = itemarr;
    }
    return _apps;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"app";
    // 1.创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
    // 2.设置cell数据
    // 2.1  取出模型
    QappsItem *item = self.apps[indexPath.row];
    // 2.2 设置标题
    cell.textLabel.text = item.name;
    // 2.3 设置子标题
    cell.detailTextLabel.text = item.download;
    // 2.4 设置图标
    
    // 3.返回cell
    return cell;
}

// 1.UI很不流畅--- > 开子线程下载图片
// 2.图片重复下载 —--> 先把下载好的图片保存起来， 用字典保存
// 内存缓存 -- --> 磁盘缓存
/*
 Documents:会备份，苹果不允许把缓存文件放到该目录下
 Library：
    Preferences：偏好设置 保存账号
    Caches：缓存文件
 tmp：临时路径，随时可能会被删除
 */

// 3.图片不会刷新 ---> 刷新某一行
// 4.图片重复下载（图片下载需要时间，当图片还未完全下载之前，又要重新显示该图片）
// 5.数据错乱 设置展位图片
@end

