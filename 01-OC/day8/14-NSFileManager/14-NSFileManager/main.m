//
//  main.m
//  14-NSFileManager
//
//  Created by wei wei on 2023/11/28.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
//    NSFileManager *fm1 = [NSFileManager defaultManager];
//    NSFileManager *fm2 = [NSFileManager defaultManager];
//    NSLog(@"%p, %p", fm1, fm2); // 单例 无论创建几次用的都是同一个 // 0x600000207340, 0x600000207340
    
    NSFileManager *manager = [NSFileManager defaultManager];
    // 1.判断一个文件或者文件夹是否存在
//    BOOL flag = [manager fileExistsAtPath:@"/Users/weiwei/Desktop/00_基础编程/OC编程/day8/15-NSFileManager.mp4"];
//    NSLog(@"flag = %i", flag);
    
    
    // 2.判断一个文件是否存在, 并且判断它是否是一个文件夹
    // 注意: 该方法的返回值是说明传入的路径对应的文件或文件夹是否存在
    //       第二个参数是用于保存判断结果的, 如果是一个目录, 那么就会赋值为YES, 如果不是就赋值为NO
//    BOOL dir = NO;
//    BOOL flag = [manager fileExistsAtPath:@"/Users/weiwei/Desktop/00_基础编程/OC编程/day8" isDirectory:&dir];
//    NSLog(@"flag = %i, dir = %i", flag, dir);
    
    
    // 3.获取文件或文件夹的属性
//    NSDictionary *info = [manager attributesOfItemAtPath:@"/Users/weiwei/Desktop/00_基础编程/OC编程/day8/15-NSFileManager.mp4" error:nil];
//    NSLog(@"info = %@", info);
    
    
    // 4.获取文件夹中所有的文件
    /*
     // 注意:contentsOfDirectoryAtPath方法有一个弊端, 只能获取当前文件夹下所有的文件, 不能获取子文件夹下面的文件
 //    NSArray *res = [manager contentsOfDirectoryAtPath:@"/Users/weiwei/Desktop/00_基础编程/OC编程/day8" error:nil];
 //    NSLog(@"res = %@", res);
     
     //subpathsAtPath 和 subpathsOfDirectoryAtPath 可以获取当前文件夹下所有的文件, 包括获取子文件夹下面的文件
 //    NSArray *res = [manager subpathsAtPath:@"/Users/weiwei/Desktop/00_基础编程/OC编程/day8"];
     NSArray *res = [manager subpathsOfDirectoryAtPath:@"/Users/weiwei/Desktop/00_基础编程/OC编程/day8" error:nil];
     NSLog(@"res = %@", res);
     */

    // 作业: 要求计算一个文件夹中所有文件的大小
    // 注意: 如果通过attributesOfItemAtPath方法直接获取, 那么获取到的文件夹的大小不准确
    // 要想实现计算一个文件夹中所有文件的大小必须先拿到所有的文件, 然后再获取所有文件的大小, 然后再相加

        
    // 5.创建文件夹
    // createDirectoryAtPath: 告诉系统文件夹需要创建到什么位置
    // withIntermediateDirectories: 如果指定的文件中有一些文件夹不存在, 是否自动创建不存在的文件夹
    // attributes: 指定创建出来的文件夹的属性
    // error: 是否创建成功, 如果失败会给传入的参数赋值
    // 注意: 该方法只能用于创建文件夹, 不能用于创建文件
//    BOOL flag = [manager createDirectoryAtPath:@"/Users/weiwei/Desktop/Q/ww" withIntermediateDirectories:NO attributes:nil error:nil];
//    NSLog(@"flag = %i", flag);
    
    

    // 6.创建文件
    // createFileAtPath: 指定文件创建出来的位置
    // contents : 文件中的内容
    // attributes: 创建出来的文件的属性
    // error: 是否创建成功, 如果失败会给传入的参数赋值
    // 注意: 该方法只能用于创建文件夹, 不能用于创建文件
    // NSData : 二进制数据
    // 注意: 该方法只能用于创建文件, 不能用于创建文件夹
    NSString *str = @"太阳，星星，月亮和你";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    BOOL flag = [manager createFileAtPath:@"/Users/weiwei/Desktop/abc.txt" contents:data attributes:nil];
    NSLog(@"flag = %i", flag);
    return 0;
}
