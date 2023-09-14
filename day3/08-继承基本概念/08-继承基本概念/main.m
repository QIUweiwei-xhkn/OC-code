//
//  main.m
//  08-继承基本概念
//
//  Created by wei wei on 2023/9/14.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
#import "Android.h"
#import "Phone.h"

int main(int argc, const char * argv[]) {
    Iphone *p = [Iphone new];
    [p signalWithNumer:@"123567"];
    Android * an = [Android new];
    [an sendMessageWithNumber:@"o12394949" andContent:@"哈哈哈哈"];
    
//    [p brand];
    return 0;
}
