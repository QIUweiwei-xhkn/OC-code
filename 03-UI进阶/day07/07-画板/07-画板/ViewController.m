//
//  ViewController.m
//  07-画板
//
//  Created by wei wei on 2024/7/10.
//

#import "ViewController.h"
#import "DrawView.h"
#import "HandleImageView.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, handleImageViewDelegte>
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation ViewController
// 属于谁的东西到谁里面写
// 清屏
- (IBAction)clear:(id)sender {
    [self.drawView clear];
}
// 擦除
- (IBAction)erase:(id)sender {
    [self.drawView erase];
}
// 撤销
- (IBAction)undo:(id)sender {
    [self.drawView undo];
}
// 设置线的宽度
- (IBAction)setLineWidth:(UISlider *)sender {
    int maxWidth = 100.0;
    [self.drawView setLineWidth:sender.value * maxWidth];
}


// 设置线的颜色
- (IBAction)changeLineColor:(UIButton *)sender {
    [self.drawView setLineColor:sender.backgroundColor];
}

// 保存
- (IBAction)save:(id)sender {
    // 把绘制的东西保存到系统相册
    // 1.开启一个和绘制VIew一样大的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    // 2.把绘制的内容渲染到位图上下文上
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    [self.drawView.layer renderInContext:ctr];
    // 3.取得位图上下文的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 4.关闭位图上下文
    UIGraphicsEndImageContext();
    // 5.把获得的图片保存到系统相册里
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//-(void)saveSuccess {
//    NSLog(@"%s",__func__);
//}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        NSLog(@"图片保存成功");
        // 保存成功后的操作
    } else {
        NSLog(@"图片保存失败：%@", [error localizedDescription]);
        // 保存失败后的操作
    }
}

// 照片
- (IBAction)photo:(id)sender {
    // 1.弹出系统相册
    UIImagePickerController *pcVC = [[UIImagePickerController alloc] init];
    /* UIImagePickerControllerSourceTypePhotoLibrary
     UIImagePickerControllerSourceTypeCamera
     UIImagePickerControllerSourceTypeSavedPhotosAlbum
     */
    pcVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pcVC.delegate = self;
    // modal出系统相相册
    [self presentViewController:pcVC animated:YES completion:nil];
}


// 选择某一个图片时，会调用这个方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"%@", info);
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
//    NSData *data = UIImagePNGRepresentation(image);
//    NSData *data = UIImagePNGRepresentation(image);
//    [data writeToFile:@"/Users/weiwei/Desktop/image.jpg" atomically:YES];
//    [data writeToFile:@"/Users/weiwei/Desktop/image.png" atomically:YES];
    
    HandleImageView *handleV = [[HandleImageView alloc] initWithFrame:self.drawView.frame];
    handleV.backgroundColor = [UIColor clearColor];
    handleV.image = image;
    handleV.delegate = self;
    [self.view addSubview:handleV];
    
    
    // 取消系统弹出的相册
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)handleImageView:(HandleImageView *)handleImageView newImage:(UIImage *)newImage {
    self.drawView.image = newImage;
}

// 拖动
- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint transP = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(self.view.transform, transP.x, transP.y);
    // 复位
//    [pan setTranslation:CGPointZero inView:pan.view];
}

// 缩放
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    [pinch setScale:1];   
}

- (void)longP:(UILongPressGestureRecognizer *)longP {
    if(longP.state == UIGestureRecognizerStateBegan) {
        // 先让图片闪一下，把图片绘制到画板中
        [UIView animateWithDuration:0.3 animations:^{
            longP.view.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                longP.view.alpha = 1;
            } completion:^(BOOL finished) {
                // 把图片绘制到画板中
                UIGraphicsBeginImageContextWithOptions(longP.view.bounds.size, NO, 0);
                CGContextRef ctr = UIGraphicsGetCurrentContext();
                [longP.view.layer renderInContext:ctr];
                
                UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                self.drawView.image = image;
                [longP.view removeFromSuperview]; 
            }];
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
