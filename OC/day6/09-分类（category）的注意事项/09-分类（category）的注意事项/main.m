//
//  main.m
//  09-分类（category）的注意事项
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Q.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
//    p.height = 1.75;
    [p say];
    return 0;
}
