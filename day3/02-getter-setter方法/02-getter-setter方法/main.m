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
    [gp setSize:5];
        NSLog(@"size = %i", [gp size]);
        return 0;
    
    return 0;
}
