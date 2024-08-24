//
//  QwwTopVideoView.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/20.
//

#import "QwwTopVideoView.h"
#import "QwwTopicItem.h"
#import "QwwSeeBigPictureViewController.h"

@interface QwwTopVideoView ()
@property (weak, nonatomic) IBOutlet UILabel *playcountLabel;
@property (weak, nonatomic) IBOutlet UILabel *videotimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *placehoderView;
@end

@implementation QwwTopVideoView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBigPicture)];
    [self.imageView addGestureRecognizer:tapGesture];
}

/*
 点击查看大图
 */
- (void)seeBigPicture {
    QwwSeeBigPictureViewController *seeBigPictureVC = [[QwwSeeBigPictureViewController alloc] init];
    seeBigPictureVC.topic = self.topic;
    [self.window.rootViewController presentViewController:seeBigPictureVC animated:YES completion:nil];
}

- (void)setTopic:(QwwTopicItem *)topic {
    _topic = topic;
    UIImage *placehoderImage = nil;
    [self.imageView qww_setOriginImage:topic.image1 andThumbnailImage:topic.image0 placehoderImage:placehoderImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if(!image) return;
        self.placehoderView.hidden = YES;
    }];
    // 播放数量
    if(topic.playcount > 10000) {
        self.playcountLabel.text = [NSString stringWithFormat:@"%.1f万播放", topic.playcount/10000.0];
    }else if(topic.playcount > 0) {
        self.playcountLabel.text = [NSString stringWithFormat:@"%zd播放", topic.playcount];
    }
    // %04d：占据4位，多余的空位用0填补
    self.videotimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", topic.videotime / 60, topic.videotime % 60];
}
@end
