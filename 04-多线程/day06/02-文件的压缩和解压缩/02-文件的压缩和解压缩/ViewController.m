//
//  ViewController.m
//  02-文件的压缩和解压缩
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"
#import "SSZipArchive/SSZipArchive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self zip3];
}

// 压缩
-(void)zip {
    /*
     第一个参数：压缩后文件的存放路径
     第二个参数：要压缩文件的路径
     */
    NSArray *arrM = @[
        @"/Users/weiwei/Desktop/1.png",
        @"/Users/weiwei/Desktop/2.png"
    ];
    //    [SSZipArchive createZipFileAtPath:@"/Users/weiwei/Desktop/Test.zip" withFilesAtPaths:arrM];
    
    /*
     第一个参数：压缩后文件的存放路径
     第二个参数：要压缩文件的路径
     第三个参数：密码
     */
    [SSZipArchive createZipFileAtPath:@"/Users/weiwei/Desktop/Test.zip" withFilesAtPaths:arrM withPassword:@"123"];
}

// 压缩
-(void)zip2 {
    /*
     第一个参数：压缩后文件夹的存放路径
     第二个参数：要压缩文件夹的路径
     */
    [SSZipArchive createZipFileAtPath:@"/Users/weiwei/Desktop/Test.zip" withContentsOfDirectory:@"/Users/weiwei/Desktop/Test"];
    
    /*
     第一个参数：压缩后文件夹的存放路径
     第二个参数：要压缩文件夹的路径
     第三个参数：密码
     */
    [SSZipArchive createZipFileAtPath:@"/Users/weiwei/Desktop/Test.zip" withContentsOfDirectory:@"/Users/weiwei/Desktop/Test" withPassword:@"123"];
}


// 解压缩
- (void)zip3 {
    /*
     第一个参数：要解压的文件路径
     第二个参数：解压后的文件保存路径
     */
//    [SSZipArchive unzipFileAtPath:@"/Users/weiwei/Desktop/Test.zip" toDestination:@"/Users/weiwei/Desktop/xx"];
    
    [SSZipArchive unzipFileAtPath:@"/Users/weiwei/Desktop/Test.zip" toDestination:@"/Users/weiwei/Desktop/xx" progressHandler:^(NSString *entry, unz_file_info zipInfo, long entryNumber, long total) {
            NSLog(@"总共有%zd个解压文件，已解压%zd个， 还剩%zd个", total, entryNumber, total - entryNumber);
        } completionHandler:^(NSString *path, BOOL succeeded, NSError *error) {
            NSLog(@"解压结束");
        }];
}
@end
