//
//  ViewController.m
//  05-UIView的常见属性
//
//  Created by wei wei on 2023/12/19.
//

#import "ViewController.h"

@interface ViewController ()
// 粉色的View
@property (weak, nonatomic) IBOutlet UIView *pinkView;

@end

@implementation ViewController
-(void)loadView {
    [super loadView];
//    NSLog(@"%s",__func__);
}

/*
    1.系统调用
 ·  2.控制器的view加载完毕的时候调用
    3.控件的初始化，数据的初始化（懒加载）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.1查看粉色view的父控件
//    NSLog(@"%@-----------------%@",self.pinkView.superview,super.view);

    // 1.2查看粉色view的子控件
//    NSLog(@"%@",self.pinkView.subviews);
    
    // 1.3控制器view的子控件
//    NSLog(@"%@",self.view.subviews);

    // 1.4控制器view的父控件
    NSLog(@"viewDidLoad__________%@",self.view.superview);
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear_______%@",self.view.superview);
}
/*
    1.系统调用
    2.当控制器控制器收到内存警告时调用
    3.去除一些不必要的内存，去耗时内存
 */
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
