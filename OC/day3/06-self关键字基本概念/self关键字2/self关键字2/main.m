//
//  main.m
//  self关键字2
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {
    Iphone *p = [Iphone new];
    NSLog(@"p = %p", p);
    [p carameWithFlahlightStatus:kFlahlightStatusOpen];
    return 0;
}
