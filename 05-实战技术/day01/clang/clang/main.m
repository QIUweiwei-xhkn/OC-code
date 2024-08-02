//
//  main.m
//  clang
//
//  Created by wei wei on 2024/7/31.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id objc = [NSObject alloc];
//        id objc = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSObject"), sel_registerName("alloc"));
        
        objc = [objc init];
        
//        objc = ((id (*)(id, SEL))(void *)objc_msgSend)((id)objc, sel_registerName("init"));
    }
    return 0;
}
