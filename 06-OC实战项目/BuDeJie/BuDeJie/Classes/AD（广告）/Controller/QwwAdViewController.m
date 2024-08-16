//
//  QwwAdViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/11.
//

#import "QwwAdViewController.h"
#import "QwwMainTabBarController.h"

@interface QwwAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *adContentImageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
/** 广告倒计时计时器   */
@property(nonatomic, weak) NSTimer *timer;
@end

@implementation QwwAdViewController
- (IBAction)jumpBtnCLick:(id)sender {
    // 更改根控制器, 销毁广告界面，进入主框架界面
    QwwMainTabBarController *tabBarVC = [[QwwMainTabBarController alloc] init];
    self.view.window.windowScene.keyWindow.rootViewController = tabBarVC;
    // 移除定时器
    [_timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置启动图片
    [self setupLaunchImage];
    
    // 加载广告数据 ==》拿到活数据 ==〉 服务器 ==》 查看接口文档 1.判断接口对不对 2.解析数据 （w_picurl,ori_curl：跳转到广告界面，w,h）=> 请求数据（AFN）
    // 导入AFN框架：cocodpods，
    // cocodpods：管理第三方库，cocodpods做的事情：导入一个框架，会把这个框架依赖的所有框架都导入
    /* 
     // cocodpods步骤：进入到指定的项目文件中
     1.创建podfile：描述需要导入哪些框架， touch podfile
     2.打开podfile描述, open podfile
     3.搜索需要倒入的框架描述  pod search AFN
     4.安装第三方框架  pod install --no-repo-update
     
     cocodpods指令了解
     pod -help:
     // —-no-repo-update Skip running 'pod repo update' before install
     Podfile.lock:第一次pod，就会自动生成这个文件，描述当前导入框架版本
     pod install:根据Podfile.lock去加载.第一次会根据podfile文件加载
     pod update:去查看之前导入框架有没有新的版本，如果有新的版本就会去加载，并且更新Podfile.lock
     pod repo:管理第三方仓库的索引，去寻找框架有没有最新版本，有就记录
    */
    //  加载广告
    [self loadAdData];
    
    // 倒计时, 创建一个计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

#pragma mark - timeChange
- (void)timeChange {
    static int i = 3;
    if(i == 0) {
        [self jumpBtnCLick:nil];
    }
    i--;
    _jumpBtn.titleLabel.text = [NSString stringWithFormat:@"跳过（%d）",i];
}

#pragma mark - 加载广告
- (void)loadAdData {
    // unacceptable content-type: text/html" 响应头
    // 1.创建请求会话管理者
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    // 2.拼接參数
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    parameters [@"code2"] = code2;
//    // 3.发送请求
//    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters
//    progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
//        // 请求数据 - 解析数据 ->展示数据
//        NSLog (@"%@", response0bject);
//    } failure:*(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
//     {
//        NSLog(@"%@", error);
//    }]:
}

#pragma mark - 设置启动图片
- (void)setupLaunchImage {
    self.launchImageView.image = [UIImage imageNamed:@"LaunchImage"];
    // 屏幕适配
    // 6p:LaunchImage-800-Portrait-736h@3x.png
    // 6:LaunchImage-800-667h@2x.png
    // 5:LaunchImage-568h@2x.png
    // 4s:LaunchImage@2x.png
//    if (iphone6P) { // 6р
//        self. launchImageView. image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
//    } else if (iphone6) { // 6
//        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
//    } else if (iphone5) { // 5
//        self. launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"] ;
//    } else if (iphone4) { // 4
//        self. launchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
//    }
}




@end
