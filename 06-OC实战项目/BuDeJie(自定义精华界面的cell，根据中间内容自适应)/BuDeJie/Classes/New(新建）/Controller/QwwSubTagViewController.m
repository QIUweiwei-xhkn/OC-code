//
//  QwwSubTagViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/12.
//

#import "QwwSubTagViewController.h"
#import "QwwSubTagItem.h"
#import "QwwSubTagCell.h"
#import <SVProgressHUD.h>

static NSString * const ID = @"cell";

@interface QwwSubTagViewController ()
/** <#注释#>   */
@property(nonatomic, strong) NSArray *subTags;
/** <#注释#>   */
//@property(nonatomic, weak) AFHTTPSessionManager *mgr;
@end

@implementation QwwSubTagViewController
// 接口文档：请求url（基本url和参数）请求方式
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 展示标签数据 --》 请求数据（接口文档）
    [self loadData];
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"QwwSubTagCell" bundle:nil] forCellReuseIdentifier:ID];
    
    self.title = @"推荐标签";
    
    // 处理cel1分割线 1.自定义分割线 2.系统属性(ios8.0之后才支持) 3.万能方式（重写系统的setFrame）了解tableView的底层实现：1.取消系统自带的分割线 2.把tableView的背景颜色设为分割线的颜色 3.重写setFrame
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = QColor(220, 220, 221);
    // 清空tableView分割线内边距 清空ceLl的约束边缘
//    self.tableView.separatorInset = UIEdgeInsetsZero;
    /*
         头像变成圆角
         处理数据
     */
    
    // 提示用户当前正在加载数据
    [SVProgressHUD showWithStatus:@"正在加载中……"];
}

// 界面即将消失前调用
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 销毁指示器
    [SVProgressHUD dismiss];
    // 取消之前的请求
//    [_mgr.task makeObjectsPerformSelector:@selector(cancel)];
}

#pragma mark - 申请数据
- (void)loadData {
    // 网络申请 活数据
    // 1.创建请求会话管理者
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    _mgr = mgr;
//    // 2.拼接参数
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    parameters [@"a"] = @"tag_recommend";
//    parameters [@"action"] = @"sub";
//    parameters [@"c"] = @"topic";
//    // 3.发送申请
//    [mgr GET: @"http://api.budejie.com/api/api_open.php" parameters:parameters
//    progress:nil success:^(NSURLSessionDataTask *_Nonnull task, NSArray * _Nullable responseObject) {
////        ［responseObject writeToFile:@["/Users/xiaomage/Desktop/课堂共享/11大神班上课资料/08-项目/0315/代码/05-订阅标签/tag.plist" atomically:YES];
////        NSLog (@"%@", responseObject) ;
//    // 字典数组转换模型数组
//        [QwwSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
//     // 刷新表格
//        [self.tableView reloadData];
//    } failure:^(NSURLSessionDataTask *_Nullable task, NSError * _Nonnull error){
//        
//    }];
    
    // 暂用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"tag.plist" ofType:nil];
        NSArray *dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        self.subTags = [QwwSubTagItem mj_objectArrayWithKeyValuesArray:dataArr];
        [self.tableView reloadData];
    });
    
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
//     用indexPath一定要先注册
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];

    // 自定义cell
    QwwSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    
    // 注意：从xib中加载出来的cell一定要要绑定标识符
    // 注册cell
//    if(cell == nil) {
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QwwSubTagCell class]) owner:nil options:nil][0];
//    }
    
    QwwSubTagItem *subTagItem = self.subTags[indexPath.row];
//    cell.textLabel.text = subTagItem.theme_name;
    cell.subTagItem = subTagItem;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
