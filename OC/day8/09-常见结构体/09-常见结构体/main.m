//
//  main.m
//  09-常见结构体
//
//  Created by wei wei on 2023/11/27.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 1.保存坐标的
//    NSPoint;
//    CGPoint point = NSMakePoint(10, 20);

    // 2.保存尺寸的
//    NSSize;
//    CGSize size = NSMakeSize(100, 50);
    
    // 3.保存坐标和尺寸
//    NSRect;
    CGRect rect = NSMakeRect(10, 20, 100, 50);
    
    // 4.在开发中苹果推荐我们使用CG开头的结构体, 也就是说NS开头的结构体一般不用
    return 0;
}
