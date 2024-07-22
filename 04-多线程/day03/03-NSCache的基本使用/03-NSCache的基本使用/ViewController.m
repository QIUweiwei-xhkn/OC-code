//
//  ViewController.m
//  03-NSCache的基本使用
//
//  Created by wei wei on 2024/7/22.
//

#import "ViewController.h"

@interface ViewController () <NSCacheDelegate>
/** <#注释#>   */
@property(nonatomic, strong) NSCache *cache;
@end

@implementation ViewController
- (NSCache *)cache {
    if(_cache == nil) {
        _cache = [[NSCache alloc] init];
        _cache.totalCostLimit = 5;  // 总成本是5，如果发现保存的数据的超过总成本会自动释放之前保存的数据（对象）
        _cache.delegate = self;
    }
    return _cache;
}



- (IBAction)addBtnClick:(id)sender {
    // //NSCache的Key只是对对象进行Strong引用，不是拷贝 
    NSData *imageData = [NSData dataWithContentsOfFile:@"/Users/weiwei/Desktop/截屏2024-07-21 22.31.12.png"];
    for(int i = 0; i < 10; i++) {
        // cost: 成本
        [self.cache setObject:imageData forKey:@(i) cost:1];
        NSLog(@"保存数据%d", i);
    }
}
- (IBAction)checkBtnClick:(id)sender {
    NSLog(@"+++++++++++++++++++++++");
    for(int i = 0; i < 10; i++) {
        NSData *data = [self.cache objectForKey:@(i)];
        if(data) {
            NSLog(@"取出数据%d", i);
        }
    }
}
- (IBAction)cleanBtnClick:(id)sender {
    [self.cache removeAllObjects];
}

#pragma mark - NSCacheDelegate
// 即将回收对象的时候调用
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    NSLog(@"回收%zd", [obj length]);
}
@end
