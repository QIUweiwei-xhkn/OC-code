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
        // 4.1 创建XML解析器：SAX
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        // 4.2 设置代理
        parser.delegate = self;
        // 4.3 开始解析,阻塞
        [parser parse];
        
        // 更新UI
        [self.tableView reloadData];
    }];
}

#pragma mark - NSXMLParserDelegate
// 开始解析文档的时候调用
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"%s",__func__);
}

// 开始解析某个元素时调用
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    NSLog(@"start------%@-----%@", elementName, attributeDict);
    // 过滤根元素
    if([elementName isEqualToString:@"videos"]) {
        return;
    }
    
    // 字典转模型
    [self.videos addObject:[QVideoItem mj_objectWithKeyValues:attributeDict]];
}

// 结束解析某个元素时调用
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"end--------%@", elementName);
}

// 结束解析文档时调用
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"%s",__func__);
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
