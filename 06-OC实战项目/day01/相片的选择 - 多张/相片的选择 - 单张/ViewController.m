//
//  ViewController.m
//  相片的选择 - 单张
//
//  Created by wei wei on 2024/8/23.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "TZImagePickerController.h"
/*
 2.选择多张图片（图片数量>= 2）
 1> AssetsLibrary框架 （选择界面需要开发者自己搭建)
 2> Photos框架（选择界面需要开发者自己搭建)

 */
@interface ViewController () <TZImagePickerControllerDelegate>

@end

@implementation ViewController
- (IBAction)selectPhoto:(id)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    // 修改一次最多选择的图片数量
    imagePickerVc.maxImagesCount = 10;
    
//    NSLog(@"%@", [UIDevice currentDevice]);
//    if([UIDevice currentDevice] == UIUserInterfaceIdiomPhone) {
        imagePickerVc.modalPresentationStyle = UIModalPresentationFormSheet;
    
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"%@, %@", photos, assets);
        // 添加图片
        NSInteger number = photos.count;
        for(int i = 0; i < number; i++) {
            UIImage *image = photos[i];
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = image;
            [self.view addSubview:imageView];
            imageView.frame = CGRectMake((i % 3) * (100 + 10), (i / 3) * (100 + 10), 100, 100);
        }
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
