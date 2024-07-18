//
//  ViewController.m
//  04-UIScrollView的delegate
//
//  Created by wei wei on 2024/2/12.
//

/**
 *  1.验证是否任何oc对象都可以作为srcollView的代理
 *  2.苹果设置的代理为什么是weak  --- 防止循环引用
 */
#import "ViewController.h"
#import "QCar.h"

@interface ViewController ()
/** 车   */
@property(nonatomic, strong) QCar *car;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(0, 20, 300, 200);
    [self.view addSubview:scrollView];
    
    // 2.UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
    [scrollView addSubview:imageView];
    
    // 3.设置contentSize
    scrollView.contentSize = imageView.frame.size;
    
    // 4.设置代理
    self.car = [[QCar alloc] init];
    scrollView.delegate = self.car;
    NSLog(@"00---");
    
}


@end
