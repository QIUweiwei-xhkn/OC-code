//
//  ViewController.m
//  02-复杂的JSON解析-数据显示
//
//  Created by wei wei on 2024/7/24.
//

#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import <MediaPlayer/MPMoviePlayerViewController.h>
#import "MJExtension/MJExtension.h"
#import "QVideoItem.h"

#define baseUrlStr @"http://120.25.226.186:32812"

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, strong) NSMutableArray *videos;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 替换
    [QVideoItem mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
            @"ID":@"id"
        };
    }];
    
    // 1.确定路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video?type=JSON"];
    // 2.创建请求
    NSURLRequest *reuqest = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送异步请求
    [NSURLConnection sendAsynchronousRequest:reuqest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 容错处理
        if(connectionError) {
            return;
        }
        // 4.解析数据
        NSDictionary *dictM = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        // 复杂JOSN 1）在线格式化 2）write
        // http://tool.oschina.net/codeformat/json
//        [arrM writeToFile:@"/Users/weiwei/Desktop/123.json" atomically:YES];
        
//        self.videos = dictM[@"videos"];
        self.videos = [QVideoItem mj_objectArrayWithKeyValuesArray:dictM[@"videos"]];
        // 字典数组 ---> 模型数组
//        for(NSDictionary *dict in dictM[@"videos"]) {
//            [self.videos addObject:[QVideoItem videoWithDict:dict]];
//        }
        
        // 更新UI
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建cell
    static NSString *ID = @"videos";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 设置数据
    // 拿到该cell对应的数据
//    NSDictionary *dictM = self.videos[indexPath.row];
    QVideoItem *item = self.videos[indexPath.row];
    
    // 设置标题
//    cell.textLabel.text = dictM[@"name"];
    cell.textLabel.text = item.name;
    // 设置子标题
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"播放时长：%@", dictM[@"length"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"播放时长：%@", item.length];
    // 设置图片
//    NSString *baseUrlStr = @"http://120.25.226.186:32812";
//    NSString *urlStr = [baseUrlStr stringByAppendingPathComponent:dictM[@"image"]];
    NSString *urlStr = [baseUrlStr stringByAppendingPathComponent:item.image];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"1"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.拿到数据
//    NSDictionary *dict = self.videos[indexPath.row];
    QVideoItem *item = self.videos[indexPath.row];
//    NSString *urlStr = dict[@"url"];
    NSString *urlStr = item.url;
    // 2.拼接数据
    NSString *url = [baseUrlStr stringByAppendingPathComponent:urlStr];
    // 3.创建播放控制器
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    // 4.弹出播放器
    [self  presentViewController:vc animated:YES completion:nil];
}

@end
