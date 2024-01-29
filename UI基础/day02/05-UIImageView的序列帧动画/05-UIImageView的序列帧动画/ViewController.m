//
//  ViewController.m
//  05-UIImageView的序列帧动画
//
//  Created by wei wei on 2024/1/26.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong)NSArray *Images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"panda_1"];
    /*
     // 1.加载所有图片
     NSMutableArray<UIImage *> *images = [NSMutableArray array];
     for(int i = 1; i <= 10; i++ ) {
         //获得所有图片名称
         NSString *imageName = [NSString stringWithFormat:@"%d", i];
         //创建UIImage
         UIImage *image = [UIImage imageNamed:imageName];
         //装入数组
         [images addObject:image];
     }
     */

    self.Images = [self loadImagesWithimagePrefix:@"panda" count:12];
}
//加载所有图片
/*
    @param imagePrefix 名称前缀
    @param count 图片的总个数
 */

/*
    图片的两种加载方式
    1.imageNamed：
     a.就算指向它的指针被销毁，该资源也不会被从内存中干掉
     b.放到Assets.xcassets的图片，默认就有缓存
     c.图片经常被使用
 
    2.imageWithContentsOfFile:
     a.指向它的指针被销毁，该资源也会被从内存中干掉
     b.放在项目中的图片就不带有缓存
     c.不经常用的，大批量的图片
 */
-(NSArray *)loadImagesWithimagePrefix:(NSString *)imagePrefix count:(int)count {
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for(int i = 1; i <= count; i++ ) {
        //获得所有图片名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%d",imagePrefix, i];
        //创建UIImage
//        UIImage *image = [UIImage imageNamed:imageName];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        //装入数组
        [images addObject:image];
    }
    return images;
}

- (IBAction)walk {
   /*
    // 1.加载所有图片
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for(int i = 1; i <= 10; i++ ) {
        //获得所有图片名称
        NSString *imageName = [NSString stringWithFormat:@"%d", i];
        //创建UIImage
        UIImage *image = [UIImage imageNamed:imageName];
        //装入数组
        [images addObject:image];
    }
    */
    // 2.设置动画图片
    self.imageView.animationImages = self.Images;
    
    // 3.设置播放次数
    self.imageView.animationRepeatCount = 0;
    
    // 4.设置播放的时长
    self.imageView.animationDuration = 1;
    
    // 5.播放
    [self.imageView startAnimating];
    
    
}
- (IBAction)stand {

    // 2.设置动画图片
    self.imageView.animationImages = self.Images;
    
    // 3.设置播放次数
    self.imageView.animationRepeatCount = 1;
    
    // 4.设置播放的时长
    self.imageView.animationDuration = 1;
    
    // 5.播放
    [self.imageView startAnimating];

    // 6.延迟
    //Selector 方法
    //Object 参数
    //afterDelay 时间
    [self performSelector:@selector(still) withObject:nil afterDelay:self.imageView.animationDuration];
}

- (IBAction)still {
    self.imageView.image = [UIImage imageNamed:@"1"];
}

@end
