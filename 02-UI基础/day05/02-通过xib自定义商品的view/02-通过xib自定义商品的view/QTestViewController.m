//
//  QTestViewController.m
//  02-通过xib自定义商品的view
//
//  Created by wei wei on 2024/2/4.
//

#import "QTestViewController.h"
#import "QShopView.h"

@interface QTestViewController ()

@end

@implementation QTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载xib
    QShopView *shopView = [[[NSBundle mainBundle] loadNibNamed:@"QShopView" owner:nil options:nil] firstObject];
//    QShopView *shopView = [[QShopView alloc] initWithFrame:CGRectMake(100, 100, 80, 100)];
    shopView.frame = CGRectMake(100, 100, 80, 100);
    
    // 给子控件设置属性
    /*
     UIImageView *imageView = [shopView viewWithTag:100];
     UILabel *titleLable = [shopView viewWithTag:200];
     
     imageView.image = [UIImage imageNamed:@"danjianbao"];
     titleLable.text = @"单肩包";
     */
    [shopView setIcon:@"danjianbao"];
    [shopView setName:@"单肩包"];
    
    [self.view addSubview:shopView];
}



@end
