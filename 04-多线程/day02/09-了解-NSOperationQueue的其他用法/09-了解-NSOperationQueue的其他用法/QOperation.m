//
//  QOperation.m
//  09-了解-NSOperationQueue的其他用法
//
//  Created by wei wei on 2024/7/20.
//

#import "QOperation.h"

@implementation QOperation
- (void)main {
    // 三个耗时操作
    for(NSInteger i = 0; i < 1000; i++) {
        NSLog(@"1---%zd----%@", i, [NSThread currentThread]);
    }
    if(self.isCancelled) return;
    NSLog(@"%d", self.isCancelled);
    
    NSLog(@"++++++++++++++++++++++++++++++++++++++++++++");
    
    for(NSInteger i = 0; i < 10000; i++) {
        NSLog(@"2---%zd----%@", i, [NSThread currentThread]);
    }
    if(self.isCancelled) return;
    NSLog(@"%d", self.isCancelled);
    
    NSLog(@"++++++++++++++++++++++++++++++++++++++++++++");
    
    for(NSInteger i = 0; i < 10000; i++) {
        NSLog(@"3---%zd----%@", i, [NSThread currentThread]);
    }
    if(self.isCancelled) return;
    NSLog(@"%d", self.isCancelled);
    
}

@end
