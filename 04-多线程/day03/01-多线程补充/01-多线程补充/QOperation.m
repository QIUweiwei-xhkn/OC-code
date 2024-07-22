//
//  QOperation.m
//  01-多线程补充
//
//  Created by wei wei on 2024/7/22.
//

#import "QOperation.h"

@implementation QOperation
- (void)start {
    NSLog(@"start------ start");
    [super start];
    NSLog(@"start------ end");
}

- (void)main {
    NSLog(@"main------ start");
    [super main];
    NSLog(@"main------ end");
}
@end
