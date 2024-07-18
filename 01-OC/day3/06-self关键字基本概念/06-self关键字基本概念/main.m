//
//  main.m
//  06-self关键字基本概念
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"

int main(int argc, const char * argv[]) {
    // self不能离开类, 离开类之后没有任何意义
    [Iphone carameWithFlahlightStatus:kFlahlightStatusClose];
    return 0;
}
