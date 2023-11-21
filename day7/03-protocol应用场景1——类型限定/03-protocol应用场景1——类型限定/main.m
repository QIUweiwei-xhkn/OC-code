//
//  main.m
//  03-protocol应用场景1——类型限定
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Wife.h"
#import "WifeCondition.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    // 1.协议的第一个应用场景, 可以将协议写在数据类型的右边, 明确的标注如果想给该变量赋值, 那么该对象必须遵守某个协议
//    Wife<WifeCondition> *w = [[Wife alloc] init];
    Wife *w = [[Wife alloc] init];
    p.wife = w;
    [p show];
    return 0;
}
