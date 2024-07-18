//
//  baseView.m
//  03-事件传递
//
//  Created by wei wei on 2024/7/7.
//

#import "baseView.h"

@implementation baseView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"class ---- %@", [self class]);
}

@end
