//
//  ViewController.m
//  09-loadView方法
//
//  Created by wei wei on 2024/5/9.
//

#import "ViewController.h"
#import "QVIew.h"

@interface ViewController ()

@end

@implementation ViewController
// loadView作用：用来创建控制器的View
// 但控制器的View第一次使用的时候调用
// loadView底层原理
    // 1.先判断当前控制器是否是从StoryBoard中加载的，如果是从StoryBoard中加载的控制器，那么它会从StoryBoard中加载的控制器的View，设为当前控制器的view
    // 2.判断当前控制器是否是从xib中加载的，如果是从xib中加载的控制器，那么它会从xib中指定的View，设为当前控制器的view
    // 3.如果也不是从xib中加载的，则会创建空白的view
-(void)loadView {
//    QVIew *QV = [[QVIew alloc] initWithFrame:self.view.bounds];
//    self.view = QV;  // 死循环
    
//    QVIew *QV = [[QVIew alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.view = QV;
    // 如果一个控制器不能接收事件，那么它的子控件也不能接收事件
    UIImageView *iamgeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    iamgeView.userInteractionEnabled = YES;
    self.view = iamgeView;
}
// 懒加载，死循环调用
//-(UIView *)view {
//    if(_view == nil) {
//        [self loadView];
//    }
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
