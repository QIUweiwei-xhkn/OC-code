//
//  ViewController.m
//  07-IOS中播放音效
//
//  Created by wei wei on 2024/1/28.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//背景图片
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

//播放器
@property (nonatomic, strong) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.加毛玻璃
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    
    // 2.设置frame
    toolbar.frame = self.bgImageView.bounds;
    
    // 3.设置样式和透明度
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.46;
    
    // 4.加到背景图片上
    [self.bgImageView addSubview:toolbar];
    
    // 5.创建播放器
    /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"juhao.m4a" ofType:nil];
     NSURL *url = [NSURL fileURLWithPath:path];
     */

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"juhao.m4a" withExtension:nil];
    
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
}

//  切换歌曲
- (IBAction)changeMusic:(UIButton *)button {
    // 歌曲名称
    NSString *musicName = nil;
    switch (button.tag) {
        case 1:
            musicName = @"buzhide.m4a";
            break;
        case 2:
            musicName = @"dingdong.m4a";
            break;

        default:
            break;
    }   
    NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    
    // 播放
    [self.player play];
}

// 播放或暂停
- (IBAction)playOrPause:(UIButton *)button {
    switch (button.tag) {
        case 3:
            [self.player play];
            break;
        case 4:
            [self.player pause];
            break;
            
        default:
            break;
    }
}


@end
