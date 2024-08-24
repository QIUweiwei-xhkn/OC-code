//
//  QwwTopicCell.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/19.
//

#import "QwwTopicCell.h"
#import "QwwTopicItem.h"
#import "UIImageView+WebCache.h"

#import "QwwTopVideoView.h"
#import "QwwTopPictureView.h"
#import "QwwTopVoiceView.h"

@interface QwwTopicCell ()
// 控件的命名  -> 功能 + 控件类型
/** 用户的头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 用户昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 发布时间 */
@property (weak, nonatomic) IBOutlet UILabel *passTimeLabel;
/** 内容 */
@property (weak, nonatomic) IBOutlet UILabel *topicTextLabel;
/** 顶 按钮*/
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
/** 踩 按钮*/
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
/** 转发 按钮*/
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
/** 回复 按钮*/
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/** 最热评论用户名 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
/** 最热评论内容 */
@property (weak, nonatomic) IBOutlet UILabel *topTextLabel;

/** 图片控件   */
@property(nonatomic, weak) QwwTopPictureView *topPictureView;
/** 声音控件   */
@property(nonatomic, weak) QwwTopVoiceView *topVoiceView;
/** 视频控件   */
@property(nonatomic, weak) QwwTopVideoView *topVideoView;

@end

@implementation QwwTopicCell
#pragma mark - 懒加载
- (QwwTopPictureView *)topPictureView {
    if(_topPictureView == nil) {
        QwwTopPictureView *topPictureView = [QwwTopPictureView qww_viewFromXib];
        [self.contentView addSubview:topPictureView];
        _topPictureView = topPictureView;
    }
    return _topPictureView;
}

- (QwwTopVoiceView *)topVoiceView {
    if(_topVoiceView == nil) {
        QwwTopVoiceView *topVoiceView = [QwwTopVoiceView qww_viewFromXib];
        [self.contentView addSubview:topVoiceView];
        _topVoiceView = topVoiceView;
    }
    return _topVoiceView;
}

- (QwwTopVideoView *)topVideoView {
    if(_topVideoView == nil) {
        QwwTopVideoView *topVidepView = [QwwTopVideoView qww_viewFromXib];
        [self.contentView addSubview:topVidepView];
        _topVideoView = topVidepView;
    }
    return _topVideoView;
}


#pragma mark - 初始化
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    
}


- (IBAction)moreButtonClick:(id)sender {
    NSLog(@"%s",__func__);
}

- (void)setTopic:(QwwTopicItem *)topic {
    _topic = topic;
    
    // 设置顶部和底部控件的具体数据（如文字数据，图片数据）
    self.nameLabel.text = topic.name;
    self.passTimeLabel.text = topic.passtime;
    self.topicTextLabel.text = topic.text;
    
    // 设置头像
    [self.profileImageView qww_setHeader:topic.profile_image];
    
    
    [self setupButtonTitle:self.dingButton number:topic.ding];
    [self setupButtonTitle:self.caiButton number:topic.cai];
    [self setupButtonTitle:self.repostButton number:topic.repost];
    [self setupButtonTitle:self.commentButton number:topic.comment];
    
    // 最热评论
    if(topic.top_cmt.count) { // 有最热评论
        self.topCmtView.hidden = NO;
    }else { // 无最热评论
        self.topCmtView.hidden = YES;
    }
    
    NSDictionary *top_cmt = topic.top_cmt;
    NSString *topcmt_name = top_cmt[@"user_name"];
    NSString *content = top_cmt[@"content"];
    if(content.length == 0) {
        content = @"[语音评论]";
    }
    self.topTextLabel.text = [NSString stringWithFormat:@"%@ : %@", topcmt_name, content];
    
    // 设置中间的内容
    if(topic.type == QwwTopicTypePicture) { // 图像
        self.topPictureView.topic = topic;
        self.topVideoView.hidden = YES;
        self.topVoiceView.hidden = YES;
        self.topPictureView.hidden = NO;
    }else if(topic.type == QwwTopicTypeVideo) { // 视频
        self.topVideoView.topic = topic;
        self.topVideoView.hidden = NO;
        self.topVoiceView.hidden = YES;
        self.topPictureView.hidden = YES;
    }else if(topic.type == QwwTopicTypeVoice) { // 声音
        self.topVoiceView.topic = topic;
        self.topVideoView.hidden = YES;
        self.topVoiceView.hidden = NO;
        self.topPictureView.hidden = YES;
    }else if(topic.type == QwwTopicTypeWord) {  // 段子
        self.topVideoView.hidden = YES;
        self.topVoiceView.hidden = YES;
        self.topPictureView.hidden = YES;
    }
}

/*
 [[QwwVideoViewController alloc] init] 会依次在项目中加载
 1. QwwVideoViewController.xib
 2. QwwVideoView.xib
 报错信息：'NSInternalInconsistencyException', reason: '-[UIViewController _loadViewFromNibNamed:bundle:] loaded the "QwwVideoView" nib but the view outlet was not set.'
 报错原因：在使用xib创建控制器view时，并没有通过File's Owner设置控制器的view属性
 解决方案：通过File's Owner设置控制器的view属性某一个view
 
 报错信息：'NSInternalInconsistencyException', reason: '-[UITableViewController loadView] loaded the "QwwVideoView" nib but didn't get a UITableView.'
 报错原因：在使用xib创建tableViewController的view时，并没有设置控制器的view为一个UITableView
 解决方案：通过File's Owner设置控制器的view属性某一个view
 */

/// 设置按钮文字
/// - Parameters:
///   - button: 要设置的按钮
///   - number: 按钮的数字
- (void)setupButtonTitle:(UIButton *)button number:(NSInteger)number {
    if(number > 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number/10000.0] forState:UIControlStateNormal];
    }else if(number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    }else {
        [button setTitle:button.titleLabel.text forState:UIControlStateNormal];
    }
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= QwwMargin;
//    frame.origin.x += 10;
//    frame.size.width -= 20;
    [super setFrame:frame];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置中间的内容的尺寸
    if(self.topic.type == QwwTopicTypePicture) { // 图像
        self.topPictureView.frame = self.topic.middleFrame;
    }else if(self.topic.type == QwwTopicTypeVideo) { // 视频
        self.topVideoView.frame = self.topic.middleFrame;
    }else if(self.topic.type == QwwTopicTypeVoice) { // 声音
        self.topVoiceView.frame = self.topic.middleFrame;
    }
}
@end
