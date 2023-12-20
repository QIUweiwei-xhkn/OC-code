//
//  main.m
//  10-super
//
//  Created by wei wei on 2023/9/20.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"

int main(int argc, const char * argv[]) {
    Iphone *p = [Iphone new];
    [p test];
    [Iphone carameWithFlahlightStatus:kFlahlightStatusOpen];
    return 0;
}
