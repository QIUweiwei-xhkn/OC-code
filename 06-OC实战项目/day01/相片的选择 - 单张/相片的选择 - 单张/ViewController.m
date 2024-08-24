//
//  ViewController.m
//  相片的选择 - 单张
//
//  Created by wei wei on 2024/8/23.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
/*
 一、从相册里面选择图片到App中
 1.选择单张图片
 1> UIImagePickerController（自带选择界面）
 2> AssetsLibrary框架 （选择界面需要开发者自己搭建)
 3> Photos框架 （选择界面需要开发者自己搭建)
 
 2.选择多张图片（图片数量>= 2）
 1> AssetsLibrary框架 （选择界面需要开发者自己搭建)
 2> Photos框架（选择界面需要开发者自己搭建)
 
 二、利用照相机拍一张照片到App
 1> UIImagePickerController（自带选择界面）
 2> AVCaptureSession
 */
@interface ViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (IBAction)selectPhoto:(id)sender {
    // UIAlertControllerStyleAlert ：相当于弹出一个UIAlertView
    // UIAlertControllerStyleActionSheet ：相当于弹出一个UIActionSheet
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    // 按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openAlbum];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"照相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openCamera];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 打开照相机
- (void)openCamera {
    // UIImagePickerControllerSourceTypeSavedPhotosAlbum ：从Moments相册中选一张图片
    // UIImagePickerControllerSourceTypePhotoLibrary ：从所有相册中选一张图片
    // UIImagePickerControllerSourceTypeCamera ：利用照相机中拍一张图片
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:YES completion:nil];
}

// 打开相册
- (void)openAlbum {
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = info[@"UIImagePickerControllerOriginalImage"];
//    NSLog(@"%@", info);
}
@end
