//
//  QwwEssenceViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/8.
//

#import "QwwEssenceViewController.h"
#import "UIBarButtonItem+Item.h"
#import "QwwTitleButton.h"
#import "QwwAllViewController.h"
#import "QwwVideoViewController.h"
#import "QwwVoiceViewController.h"
#import "QwwPictureViewController.h"
#import "QwwWordViewController.h"
#import "QwwTopicViewController.h"

/*
 名字叫attributes并且是NSDictionary *类型的參数，它的key一般都有以下规律
 1.i057开始
 1> 所有的key都来源于：NSAttributedString.h
 2> 格式基本都是：NS***AttributeName
 
 2.i057之前
 1> 所有的key都来源于：UIStringDrawing.h
 2> 格式基本都是：UITextAttribute***
 */

@interface QwwEssenceViewController () <UIScrollViewDelegate>
/** 滚动栏   */
@property(nonatomic, weak) UIScrollView *scrollView;
/** 标题栏   */
@property(nonatomic, weak) UIView *titleView;
/** 当前选中的按钮   */
@property(nonatomic, weak) UIButton *previousSelectedBtn;
/** 标题栏下划线   */
@property(nonatomic, weak) UIView *underLineView;

@end
// UIBarButtonItem：描述按钮具体的内容
// UINavigationItem：设置导航条上内容（左边，右边，中间）
// tabBarItem：设置tabBar上按钮内容（tabBarButton）
@implementation QwwEssenceViewController
#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // 添加所有tableViewControl的子控制器
    [self setpAllChildVCs];
    // 设置导航条
    [self setuptabBar];
    // 添加scrollView
    [self setupScrollView];
    // 添加标题栏
    [self setupTitleBar];
    // 添加第一个界面的tableViewController
//    UIView *childView = self.childViewControllers[0].view;
//    childView.frame = CGRectMake(0 , 0, self.scrollView.qww_width, self.scrollView.qww_height);
//    [self.scrollView addSubview:childView];
    [self addChildViewIntoScrollView:0];
//    [self addChildViewIntoScrollView];
}

// 添加所有tableViewControl的子控制器
- (void)setpAllChildVCs {
//    [self addChildViewController:[[QwwAllViewController alloc] init]];
//    [self addChildViewController:[[QwwVideoViewController alloc] init]];
//    [self addChildViewController:[[QwwVoiceViewController alloc] init]];
//    [self addChildViewController:[[QwwPictureViewController alloc] init]];
//    [self addChildViewController:[[QwwWordViewController alloc] init]];
    
    QwwAllViewController *all = [[QwwAllViewController alloc] init];
    all.type = QwwTopicTypeAll;
    [self addChildViewController:all];
    
    QwwVideoViewController *video = [[QwwVideoViewController alloc] init];
    video.type = QwwTopicTypeVideo;
    [self addChildViewController:video];
    
    QwwVoiceViewController *voice = [[QwwVoiceViewController alloc] init];
    voice.type = QwwTopicTypeVoice;
    [self addChildViewController:voice];
    
    QwwPictureViewController *picture = [[QwwPictureViewController alloc] init];
    picture.type = QwwTopicTypePicture;
    [self addChildViewController:picture];
    
    QwwWordViewController *word = [[QwwWordViewController alloc] init];
    word.type = QwwTopicTypeWord;
    [self addChildViewController:word];
}

// 添加scrollView
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    // 不允许修改scrollview的内边
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.delegate = self;
    scrollView.frame = self.view.bounds;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    NSInteger count = self.childViewControllers.count;
    CGFloat scrollViewWidth = scrollView.qww_width;
//    CGFloat scrollViewHeight = scrollView.qww_height;
    
//    for(NSInteger i = 0; i < count; i++) {
//        // 取出i位置的子控制的view
//        UIViewController *vc = self.childViewControllers[i];
//        vc.view.frame = CGRectMake(i * scrollViewWidth, 0, scrollViewWidth, scrollViewHeight);
//        [scrollView addSubview:vc.view];
//    }
    
    scrollView.contentSize = CGSizeMake(count * scrollViewWidth, 0);
    _scrollView = scrollView;
}

// 设置标题栏
- (void)setupTitleBar {
    UIView *titleView = [[UIView alloc] init];
    // 设置半透明的背景图片
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
//    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//    titleView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    // 子控件会继承父控件的设置的aplha透明度
//    titleView.alpha = 0.5 ;
    titleView.frame = CGRectMake(0, 97, self.view.frame.size.width, 35);
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    // 添加标题栏按钮
    [self setupTitleBtn];
    
    // 设置下划线
    [self setupTitleUnderLine];
}

// 设置下划线
- (void)setupTitleUnderLine {
    QwwTitleButton *btn = self.titleView.subviews.firstObject;
    UIView *underLineView = [[UIView alloc] init];
    underLineView.qww_height = 2;
    underLineView.qww_y = self.titleView.qww_height - underLineView.qww_height;
    underLineView.qww_width = 70;
    underLineView.backgroundColor = [btn titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:underLineView];
    self.underLineView = underLineView;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.previousSelectedBtn.titleLabel.font;
    [btn.titleLabel sizeToFit]; // 让lable根据文字内容计算尺寸
    underLineView.qww_width = [btn.currentTitle sizeWithAttributes:attrs].width + 10;
    underLineView.qww_centerX = btn.qww_centerX;
}

// 添加标题栏按钮
- (void)setupTitleBtn {
    UIView *titleView = self.titleView;
    // 添加点击按钮
    NSArray *titleNames = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSInteger count = titleNames.count;
    CGFloat btnW = titleView.qww_width / count;
    CGFloat btnH = titleView.qww_height;
    for(NSInteger i = 0; i < count; i++) {
        QwwTitleButton *btn = [[QwwTitleButton alloc] init];
        [btn setTag:i];
        if(i == 0) {
            btn.selected = YES;
            self.previousSelectedBtn = btn;
        }
        [titleView addSubview:btn];
        // 设置背景颜色
//        btn.backgroundColor = QRrandColor;
        // frame
        btn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
        // 文字
        [btn setTitle:titleNames[i] forState:UIControlStateNormal];
        
        // 添加点击事件
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// 设置导航条
- (void)setuptabBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_iconN"] WithHighlightedImage:[UIImage imageNamed:@"nav_item_game_click_iconN"] addTarget:self action:@selector(game)];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandomN"] WithHighlightedImage:[UIImage imageNamed:@"navigationButtonRandomClickN"] addTarget:nil action:nil];
}

#pragma mark - 监听事件处理
- (IBAction)titleBtnClick:(UIButton *)titltBtn {
    if(self.previousSelectedBtn == titltBtn) {
        // 重复标题点击按钮
        [[NSNotificationCenter defaultCenter] postNotificationName:QWWtitleButtonDidRepeatClickNotification object:nil];
    }
    // 处理点击标题按钮
    [self dealtitleBtnClick:titltBtn];
}

- (void)dealtitleBtnClick:(UIButton *)titltBtn {
    self.previousSelectedBtn.selected = NO;
    titltBtn.selected = YES;
    self.previousSelectedBtn = titltBtn;
    NSInteger index = [self.titleView.subviews indexOfObject:titltBtn];
    [UIView animateWithDuration:0.25 animations:^{
        // 处理下划线
//        NSLog(@"%@", [titltBtn titleForState:UIControlStateNormal]);
//        NSLog(@"%@", titltBtn.titleLabel.text);
//        self.underLineView.qww_width = [titltBtn.currentTitle sizeWithFont:titltBtn.titleLabel.font].width;
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = titltBtn.titleLabel.font;
//        attrs[UITextAttributeFont] = titltBtn.titleLabel.font;
        self.underLineView.qww_width = [titltBtn.currentTitle sizeWithAttributes:attrs].width + 10;
        self.underLineView.qww_centerX = titltBtn.qww_centerX;
        
        // 设置scrollview
        CGFloat offsetX = self.scrollView.qww_width * index;    // 方法一
//        CGFloat offsetX = self.scrollView.qww_width * titltBtn.tag; // 方法二
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y); // 方法一
//        CGPoint offset = self.scrollView.contentOffset;  // 方法二
//        offset.x = offsetX;
//        self.scrollView.contentOffset = offset;
    } completion:^(BOOL finished) {
        [self addChildViewIntoScrollView:titltBtn.tag];
//        [self addChildViewIntoScrollView];
    }];
    
    // 设置index对应位置的tableViewScrollView.scrollsToTop = YES,其他的都设置成NO
    for(NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *childVC = self.childViewControllers[i];
        // 如果view还没有创建，直接返回
        if(!childVC.isViewLoaded) return;
        
        UIScrollView *scrollView = (UIScrollView *)childVC.view;
        if(![scrollView isKindOfClass:[UIScrollView class]]) continue;
//        if(i == index) {    // 是标题对应的子控制器
//            scrollView.scrollsToTop = YES;
//        }else {
//            scrollView.scrollsToTop = NO;
//        }
        scrollView.scrollsToTop = (i == index);
    }
}

#pragma mark - 事件处理
// 左边按钮方法点击调用的方法
- (void)game {
    NSLog(@"%s",__func__);
}

#pragma mark - UIScrollViewDelegate 代理
// 当用户松开scrollView并且结束滑动的时候调用这个代理方法，scrollview结束滚动时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 拿到当前界面对应按钮的索引
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.qww_width;
    // 获得当前界面对应的按钮
    UIButton *cureentBtn = self.titleView.subviews[index];
    // 点击改对应按钮
    [self dealtitleBtnClick:cureentBtn];
}

//// 当用户松开scrollView的时候调用这个代理方法，结束拖拽时调用
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    
//}

#pragma mark - 其他
// 添加第index个子控制器的view到scrollView中
- (void)addChildViewIntoScrollView:(NSInteger)index {
    CGFloat scrollViwWidth = self.scrollView.qww_width;
    UIViewController *vc = self.childViewControllers[index];
    // 如果view已经被加载过，直接返回
    if([vc isViewLoaded]) return;
    // 取出index对应位置的子控制器
    UIView *childView = vc.view;
//    UIView *childView = self.childViewControllers[index].view;
//    if(childView.superview) return;
//    if(childView.window) return;
    childView.frame = CGRectMake(index * scrollViwWidth, 0, scrollViwWidth, self.scrollView.qww_height);
//    UIScrollView *scrollView = (UIScrollView *)childView;
    [self.scrollView addSubview:childView];
}

//- (void)addChildViewIntoScrollView{
//    CGFloat scrollViwWidth = self.scrollView.qww_width;
//    NSInteger index = self.scrollView.contentOffset.x /  scrollViwWidth;
//    // 取出index对应位置的子控制器
//    UIView *childView = self.childViewControllers[index].view;
//    childView.frame = CGRectMake(index * scrollViwWidth, 0, scrollViwWidth, self.scrollView.qww_height);
//    [self.scrollView addSubview:childView];
//}
@end
