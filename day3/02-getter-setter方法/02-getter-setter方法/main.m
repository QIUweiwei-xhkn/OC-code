//
//  main.m
//  02-getter-setter方法
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
int main(int argc, const char * argv[]) {
    Gun *gun = [Gun new];
        
    [gun setSize:5];
    NSLog(@"size = %i", [gun size]);
    return 0;
}
