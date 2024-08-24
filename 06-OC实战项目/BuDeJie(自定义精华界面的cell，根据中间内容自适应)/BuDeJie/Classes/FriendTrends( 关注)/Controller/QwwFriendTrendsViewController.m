//
//  QwwFriendTrendsViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/8.
//

#import "QwwFriendTrendsViewController.h"
#import "QwwLoginRegisterViewController.h"
#import "UITextField+placehoder.h"

@interface QwwFriendTrendsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation QwwFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuptabBar];
    
    // 为什么先设置占位文字颜色，后设置占位文字， 占位文字颜色设置失败 
    // 分析：为什么先设置占位文字颜色，就没有效果=>占位文字label拿不到
    //  1.保存起来
    // 设置占位文字颜色
    _textfield.placehoderColor = [UIColor greenColor];
    // 设置占位文字：每次设置占位文字的后，在拿到之前保存占位文字颜色，重新设置
//    [_textfield qww_setPlaceholder:@"123"];
    _textfield.placeholder = @"123";
}

#pragma mark - 立即注册按钮被点击
- (IBAction)loginBtnClick:(id)sender {
    // 转跳注册登入界面
    QwwLoginRegisterViewController *lgVC = [[QwwLoginRegisterViewController alloc] init];
    // 转跳
    [self presentViewController:lgVC animated:YES completion:nil];
}

#pragma mark - 设置导航条
- (void)setuptabBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] WithHighlightedImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] addTarget:self action:@selector(friendRecomment)];
    
    // title
    self.navigationItem.title = @"我的关注";
    
}

#pragma mark - 推荐关注
- (void)friendRecomment {
}
@end
