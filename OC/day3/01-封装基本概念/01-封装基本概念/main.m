//
//  main.m
//  01-封装基本概念
//
//  Created by wei wei on 2023/9/12.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

int main(int argc, const char * argv[]) {
    Gun *gp = [Gun new];
//    gp->_bullet = -10;
    // 引发这个问题的原因: 因为成员变量是public, 给成员变量赋值的时, 赋值的值不受我们的约束
    [gp addBulle:10];
    [gp shoot];
    
    // 4.查看子弹的剩余数据(获取成员变量的值)
    //    NSLog(@"bullet = %i", gp->_bullet);
        NSLog(@"bullet = %i", [gp getBullet]);
    return 0;
}
