//
//  QwwSeeBigPictureViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/22.
//

#import "QwwSeeBigPictureViewController.h"
#import "QwwTopicItem.h"
#import "SVProgressHUD.h"
#import <Photos/Photos.h>
#import "TZImagePickerController.h"

/*
 一种很常见的开发步骤
 1. 在viewDidLod方法中添加初始化子控件
 2.在viewDidLayoutSubviews方法中布局子控件（）
 
 另一种常见的开发思路
 1.控件弄成懒加载
 2. 在viewDidLayoutSubviews方法中布局子控件（设置子控件的位置和尺寸）
 */
@interface QwwSeeBigPictureViewController () <UIScrollViewDelegate, TZImagePickerControllerDelegate  >
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
/** <#注释#>   */
@property(nonatomic, weak) UIScrollView *scrollView;

/** <#注释#>   */
@property(nonatomic, weak) UIImageView *imageView;

/** 当前 app对应的自定义相册 */
- (PHAssetCollection *)createCollection;
 /** 添加图片 */
- (PHFetchResult <PHAsset *> *)createAssets;
@end

@implementation QwwSeeBigPictureViewController
- (void)setTopic:(QwwTopicItem *)topic {
    _topic = topic;
}

//- (UIScrollView *)scrollView {
//    if(!_scrollView)  {
//        UIScrollView *scrollView = [[UIScrollView alloc] init];
//        scrollView.backgroundColor = [UIColor redColor];
//        [self.view insertSubview:scrollView atIndex:0];
//        _scrollView = scrollView;
//    }
//    return _scrollView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    //    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    scrollView.frame = self.view.bounds;
    UITapGestureRecognizer *panGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backBtnClick:)];
    [scrollView addGestureRecognizer:panGes];
    scrollView.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:scrollView atIndex:0];
    self.scrollView = scrollView;
    
    // imageView
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.image1] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if(!image) return;
        self.saveBtn.enabled = YES;
    }];
    imageView.qww_width = scrollView.qww_width;
    imageView.qww_height = imageView.qww_width * self.topic.height / self.topic.width;
    imageView.qww_x = 0;
    if(imageView.qww_height > XMGScreenH) {     // 超过一个屏幕的高度
        imageView.qww_y = 0;
        scrollView.contentSize = CGSizeMake(0, imageView.qww_height);
    } else {
        imageView.qww_centerY = scrollView.qww_height * 0.5;
    }
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    // 图片缩放
    CGFloat maxScale = self.topic.width / imageView.qww_width;
    if(maxScale > 1) {
        scrollView.maximumZoomScale = maxScale;
        scrollView.delegate = self;
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

#pragma mark - 监听点击
- (IBAction)backBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 错误信息：reason: '-[NSInvocation setArgument:atIndex:]: index (2) out of bounds [-1, 1]'
 错误解释：参数越界错误，方法的参数个数和实际传递的参数个数不一致
 */

/*
 // 保存图片到【相机胶卷】
 // 拥有一个【自定义相册】
 // 添加刚才保存的图片到【自定义相册】
 
 一、保存图片到【自定义相册】
 1.保存图片到【相机胶卷】
 1> C语言函数 UIImageWriteToSavedPhotosAlbum
 - (IBAction)saveBtnClick:(id)sender {
 // 保存图片到【相机胶卷】
 UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);    // 一定要调用固定格式的方法
 // 拥有一个【自定义相册】
 // 添加刚才保存的图片到【自定义相册】
 }
 
 //- (void)done {
 //    NSLog(@"%s",__func__);
 //}
 
 - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
 if(error) {
 [SVProgressHUD showErrorWithStatus:@"保存失败"];
 }else {
 [SVProgressHUD showSuccessWithStatus:@"保存成功"];
 }
 }
 
 2> AssetsLibrary框架
 3> Photos框架
 //   直接调用 [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image]; ，会报错
 //reason: 'This method can only be called from inside of -[PHPhotoLibrary performChanges:completionHandler:] or -[PHPhotoLibrary performChangesAndWait:error:]'
 
 // 异步执行修改操作
 [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
 [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image];
 } completionHandler:^(BOOL success, NSError * _Nullable error) {
 
 }];
 
 // 同步执行修改操作
 NSError *error = nil;
 [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
 [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image];
 } error:&error];
 if(error) {
 [SVProgressHUD showErrorWithStatus:@"保存失败!"];
 } else {
 [SVProgressHUD showSuccessWithStatus:@"保存成功!"];
 }
 
 2.拥有一个【自定义相册】
 1> AssetsLibrary框架
 2> Photos框架
 
 3.添加刚才保存的图片到【自定义相册】
 1> AssetsLibrary框架
 2> Photos框架
 
 二、Photos框架须知
 1.PHAsset ：一个PHAsset对象就代表相册中的一张图片或者一个视频
 1> 查:[PHAsset fetchAssets……];
 2> 增删改: PHAssetChangeRequest
 
 2.PHAssetCollection ：一个PHAssetCollection对象就代表一个相册
 1> 查:[PHAssetCollection fetchAssetCollections……];
 2> 增删改: PHAssetCollectionChangeRequest (包括所有跟图片相关的改动操作)
 
 3.对相片\相册的任何【增删改】操作，都必须放到以下方法的block中执行
 -[PHPhotoLibrary performChanges: completionHandler:]
 -[PHPhotoLibrary performChangesAndWait:error:]
 
 Foundation和Core Foundation的数据类型可以互相转换，比如NSString * 和 CFStringRef
 NSString *string = (__bridge NSString *) kCFBundleNameKey;
 CFStringRef string = (__bridge CFStringRef)@"test";
 
 // 获得相机胶卷相册
 [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil]
 
 // 拥有一个【自定义相册】
 //    NSError *error = nil;
 //    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
 //        NSString *name = [NSBundle mainBundle].infoDictionary[@"CFBundleName"];
 ////        NSLog(@"%@", kCFBundleNameKey);
 //        [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:name];
 //    } error:&error];
 //    if(error) {
 //        [SVProgressHUD showErrorWithStatus:@"保存失败!"];
 //    } else {
 //        [SVProgressHUD showSuccessWithStatus:@"保存成功!"];
 //    }
 */

- (IBAction)saveBtnClick:(id)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"%@, %@", photos, assets);
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
    
//
}

 

- (void)test1 {
    // 请求\检查访问权限：
    // 如果用户还没有做出选择，会自动弹框，用户对弹框做出选择后，才会调用block
    // 如果之前已经做过选择，会直接执行block
    PHAuthorizationStatus oldStatus = [PHPhotoLibrary authorizationStatus];
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(status == PHAuthorizationStatusDenied) { // 用户拒绝当前app访问相册
                if(status == oldStatus) {
                    NSLog(@"提醒用户打开开关");
                }
            } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许当前app访问相册
                [self saveImageIntoAlbum];
            } else if (status == PHAuthorizationStatusRestricted) { // 无法访问相册
                [SVProgressHUD showErrorWithStatus:@"因系统的原因，无法访问相册！"];
            }
        });
    }];
}

- (void)saveImageIntoAlbum {
   // 获得相片
   PHFetchResult<PHAsset *> *createAssets = self.createAssets;
   if(createAssets == nil) {
       [SVProgressHUD showErrorWithStatus:@"保存图片失败！"];
       return;
   }

   // 获得相册
   PHAssetCollection *createCollection = self.createCollection;
   if(createCollection == nil) {
       [SVProgressHUD showErrorWithStatus:@"创建或着获取相册失败"];
       return;
   }

   // 添加刚才保存的图片到【自定义的相册】
   NSError *error = nil;
   [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
           PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createCollection];
       [request insertAssets:createAssets atIndexes:[NSIndexSet indexSetWithIndex:0]];
   } error:&error];
   // 最后的判断
   if(error) {
       [SVProgressHUD showErrorWithStatus:@"保存图片失败"];
   } else {
       [SVProgressHUD showSuccessWithStatus:@"保存图片成功"];
   }
}

- (void)savePhoto1 {
    NSError *error = nil;
    // 保存图片到【相机胶卷】
    __block PHObjectPlaceholder *placehoder = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        placehoder = [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image].placeholderForCreatedAsset;
    } error:&error];
    if(error) {
        NSLog(@"保存图片失败");
        return;
    }
    //    // 添加刚才保存的相册到【自定义相册】
    //    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
    //        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:self.createCollection];
    //        [request addAssets:@[placehoder]];
    //    } error:&error];
    
    // 获得相册
    PHAssetCollection *createCollection = self.createCollection;
    if(createCollection == nil) {
        [SVProgressHUD showErrorWithStatus:@"创建相册失败"];
        return;
    }
    // 添加刚才保存的相册到【自定义相册】
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createCollection];
        [request insertAssets:@[placehoder] atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } error:&error];
    
    
    // 最后的判断
    if(error) {
        [SVProgressHUD showErrorWithStatus:@"保存图片失败"];
    } else {
        [SVProgressHUD showSuccessWithStatus:@"保存图片成功"];
    }
}
#pragma mark - 获得当前 app对应的自定义相册
- (PHAssetCollection *)createCollection {
    // 获得软件名
    NSString *title = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleNameKey];
    // 抓取所有的自定义相册
    PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // 查找当前app对应的自定义相册
    for (PHAssetCollection *collection in collections) {
        if([collection.localizedTitle isEqualToString:title]) {
            return collection;
        }
    }
    // 当前app对应的自定义相册没有被创建过
    NSError *error = nil;
    __block NSString *createCollectionID = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        // 创建一个【自定义的相册】
        createCollectionID = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title].placeholderForCreatedAssetCollection.localIdentifier;
    } error:&error];
    if(error) return nil;
    // 根据唯一标识获得当前创建的相册
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[createCollectionID] options:nil].firstObject;
}

#pragma mark - 添加图片
- (PHFetchResult <PHAsset *> *)createAssets {
    NSError *error = nil;
    // 保存图片到【相机胶卷】
    __block NSString *assetID = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        assetID = [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image].placeholderForCreatedAsset.localIdentifier;
    } error:&error];
    if(error) return nil;
    // 获取刚才保存的照片
    return [PHAsset fetchAssetsWithLocalIdentifiers:@[assetID] options:nil];
}
@end
