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
#import "GDataXML/GDataXMLNode.h"

#define baseUrlStr @"http://120.25.226.186:32812"

@interface ViewController ()<NSXMLParserDelegate>
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
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video?type=XML"];
    // 2.创建请求
    NSURLRequest *reuqest = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送异步请求
    [NSURLConnection sendAsynchronousRequest:reuqest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 容错处理
        if(connectionError) {
            return;
        }
        // 4.解析数据
        // 4.1 获得XML文档
        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:data options:kNilOptions error:nil];
        // 4.2 拿到根元素，得到根元素内部所有名称为video的子孙元素，
        NSArray *eles = [document.rootElement elementsForName:@"videos"];
        // 4.3 遍历操作
        for (GDataXMLElement *ele in eles) {
            //元素内部所有的属性—-->模型—->添加到self.video
            QVideoItem *item = [[QVideoItem alloc] init];
            item.name = [ele attributeForName:@"name"].stringValue;
            item.image = [ele attributeForName:@"image"].stringValue;
            item.ID = [ele attributeForName:@"id"].stringValue;
            item.url = [ele attributeForName:@"url"].stringValue;
            item.length = [ele attributeForName:@"length"].stringValue;
            [self.videos addObject:item];
        }
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
