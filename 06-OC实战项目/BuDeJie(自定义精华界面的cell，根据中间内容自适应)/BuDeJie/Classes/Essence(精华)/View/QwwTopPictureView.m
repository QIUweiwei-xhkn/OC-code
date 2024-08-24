//
//  QwwTopPictureView.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/20.
//

#import "QwwTopPictureView.h"
#import "QwwTopicItem.h"
#import "QwwSeeBigPictureViewController.h"

@interface QwwTopPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *placehoderView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPictureButton;
@end

@implementation QwwTopPictureView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBigPicture)];
    [self.imageView addGestureRecognizer:tapGesture];
    // 控制按钮内部的子控件对齐，不是用contentMode，是用以下2个属性
    //    UIButton *btn；
    //    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    // 控件按钮内部与控件之间的间距
    //    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    //    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    //    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
}

/*
 点击查看大图
 */
- (void)seeBigPicture {
    QwwSeeBigPictureViewController *seeBigPictureVC = [[QwwSeeBigPictureViewController alloc] init];
    seeBigPictureVC.topic = self.topic;
    [self.window.rootViewController presentViewController:seeBigPictureVC animated:YES completion:nil];
//    [UIApplication sharedApplication].keyWindow.rootViewController presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>];
}

- (void)setTopic:(QwwTopicItem *)topic {
    _topic = topic;
    UIImage *placehoderImage = nil;
    [self.imageView qww_setOriginImage:topic.image1 andThumbnailImage:topic.image0 placehoderImage:placehoderImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if(!image) return;
        self.placehoderView.hidden = YES;
        
        // 处理超长图片的大小
        if(topic.isBigPicture) {
            CGFloat imageW = topic.middleFrame.size.width;
            CGFloat imageH = imageW * topic.height / topic.width;
            // 开启图形上下文
            UIGraphicsBeginImageContext(CGSizeMake(imageW, imageH));
            // 绘制图片到上下文中
            [self.imageView.image drawInRect:CGRectMake(0, 0, imageW, imageH)];
            // 取出图片
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            // 关闭图形上下文
            UIGraphicsEndImageContext();
        }
    }];
    
    // gif
    self.gifView.hidden = !topic.is_gif;
    //    if([topic.image1.lowercaseString hasSuffix:@"gif"]) {
    //    if([topic.image1.pathExtension.lowercaseString isEqualToString:@"gif"]) {
    //        self.gifView.hidden = NO;
    //    }else {
    //        self.gifView.hidden = YES;
    //    }
    
    // 点击查看大图片
    if(topic.isBigPicture) {
        self.seeBigPictureButton.hidden = NO;
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
    }else {
        self.seeBigPictureButton.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
}


@end
