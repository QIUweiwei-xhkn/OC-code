//
//  ViewController.m
//  01-网易新闻
//
//  Created by wei wei on 2024/8/2.
//

#import "ViewController.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIScrollViewDelegate>
@property(nonatomic, weak) UIButton *selectedbtn;
@property(nonatomic, weak) UIScrollView *titleScrollView;
@property(nonatomic, weak) UIScrollView *contentScrollView;
@property(nonatomic, strong) NSMutableArray *titlebtns;
/** <#注释#>   */
@property(nonatomic, assign) BOOL isinitial;
@end

@implementation ViewController
- (NSMutableArray *)titlebtns {
    if(_titlebtns == nil) {
        _titlebtns = [[NSMutableArray alloc] init];
    }
    return _titlebtns;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"网易新闻";
    // 1.添加标题滚动视图
    [self setupTitleScrollerView];
    // 2.添加内容滚动视图
    [self setupContentScrollerView];
    
    // 5.处理标题点击
    // 6.处理内容滚动视图滚动
    // 7.选中标题居中 =＞选中标题
}

- (void)viewWillAppear:(BOOL)animated {
    // 4.添加所有标题
    if(_isinitial == NO)  {
        [self setupAllTitle];
        _isinitial = YES;
    }
}

#pragma mark - 选中标题
- (void)selButton:(UIButton *)btn {
    _selectedbtn.transform = CGAffineTransformIdentity;
    [_selectedbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _selectedbtn = btn;
    
    // 标题居中
    [self setTitleCenter:btn];
    
    // 字体缩放；形变
    [self setTitleScale:btn];
}
#pragma mark - 字体缩放；形变
- (void)setTitleScale:(UIButton *)btn {
    btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
}

#pragma mark - 标题居中
- (void)setTitleCenter:(UIButton *)btn {
    // 本质：修改titleScrollView偏移量
    CGFloat offsetX = btn.center.x - ScreenW * 0.5;
    if(offsetX < 0) {
        offsetX = 0;
    }
    CGFloat maxOffsetX = self.titleScrollView.contentSize.width - ScreenW;
    if(offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

#pragma mark - 添加一个子控制器的view
- (void)setupOneViewController:(NSInteger)i {
    UIViewController *vc = self.childViewControllers[i];
    CGFloat x = i * ScreenW;
    vc.view.frame = CGRectMake(x, 0, ScreenW, self.contentScrollView.frame.size.height);
    [self.contentScrollView addSubview:vc.view];
    
}
#pragma mark - 处理标题点击
- (void)btnClick:(UIButton *)btn {
    NSInteger i = btn.tag;
    // 1. 标题颜色 变成 红色
    [self selButton:btn];
    // 2.把对应子控制器的viewt添加上去
    [self setupOneViewController:i];
    
    CGFloat x = i * ScreenW;
    // 3.内容滚动视图滚动到对应的位置
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
}

#pragma mark - 添加所有标题
- (void)setupAllTitle {
    // 已经把内容展示上去 ->展示的效果是否是我们想要的（调整细节）
    // 1.标题颜色 为黑色
    // 2.需要让titleScrollView可以滚动
    //    添加所有标题
    NSInteger count = self.childViewControllers.count;
    CGFloat btnW = 100;
    CGFloat btnH = self.titleScrollView.frame.size.height;
    for(int i = 0; i < count; i++) {
        CGFloat btnX = i * btnW;
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(btnX, 0, btnW, btnH)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleScrollView addSubview:btn];
        [self.titlebtns addObject:btn];
        if( i == 0) {
            [self btnClick:btn];
        }
    }
    // 设置标题滚动范围
    self.titleScrollView.contentSize  = CGSizeMake(count * btnW, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    // 设置内容滚动范围
    self.contentScrollView.contentSize = CGSizeMake(count * ScreenW, 0);
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
}

// 添加标题滚动视图
- (void)setupTitleScrollerView {
    // 创建titlescrollView
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    //    titleScrollView.backgroundColor = [UIColor redColor];
    CGFloat y = self.navigationController.navigationBarHidden ? 0 : 100 ;
    titleScrollView.frame = CGRectMake(0, y, ScreenW, 44);
    [self.view addSubview:titleScrollView];
    self.titleScrollView = titleScrollView;
}

// 添加内容滚动视图
- (void)setupContentScrollerView {
    // 创建contentscrollView
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.backgroundColor = [UIColor blueColor];
    CGFloat y = CGRectGetMaxY(self.titleScrollView.frame);
    contentScrollView.frame = CGRectMake(0, y, ScreenW, ScreenH - y);
    [self.view addSubview:contentScrollView];
    self.contentScrollView = contentScrollView;
    
    // 设置contentScrollView的属性
    // 分页
    self.contentScrollView.pagingEnabled = YES;
    // 弹簧
    self.contentScrollView.bounces = YES;
    
    // 设置代理.目的：监听内容滚动视图 什么时候滚动完成
    self.contentScrollView.delegate = self;
}

#pragma mark - UIScrollViewDelegate
// 滚动完成时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 获得角标
    NSInteger i = scrollView.contentOffset.x / ScreenW;
    // 获得当前button
    UIButton *btn = self.titlebtns[i];
    // 1.选中标题
    [self selButton:btn];
    // 2.把对应的控制器的view添加上去
    [self setupOneViewController:i];
    
}

// 滚动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 字体缩放 1.缩放比例 2.缩放哪两个按钮
    CGFloat i = self.contentScrollView.contentOffset.x / ScreenW;
    NSInteger leftI = self.contentScrollView.contentOffset.x / ScreenW;
    NSInteger rightI = leftI + 1;
    // 获取左边的按钮
    UIButton *leftBtn = self.titlebtns[leftI];
    // 获取右边的按钮
    NSInteger count = self.titlebtns.count;
    UIButton *rightBtn;
    if(rightI < count) {
        rightBtn =  self.titlebtns[rightI];
    }
    
    // 缩放比例 0~1  ==> 1~1.3
    CGFloat scaleR = i - leftI;
    rightBtn.transform = CGAffineTransformMakeScale(scaleR * 0.3 +1, scaleR * 0.3 +1);
    CGFloat scaleL = 1 - scaleR;
    leftBtn.transform = CGAffineTransformMakeScale(scaleL * 0.3 +1, scaleL * 0.3 +1);
    
    // 颜色渐变
    UIColor *rightColor = [UIColor colorWithRed:scaleR green:0 blue:0 alpha:1];
    UIColor *leftColor = [UIColor colorWithRed:scaleL green:0 blue:0 alpha:1];
    [rightBtn setTitleColor:rightColor forState:UIControlStateNormal];
    [leftBtn setTitleColor:leftColor forState:UIControlStateNormal];
}
/*
     颜色：3种颜色通道组成 R：红G：绿 B：蓝
     白色：1 1 1
     黑色：0 0 0
     红色：1 0 0
 */
@end
