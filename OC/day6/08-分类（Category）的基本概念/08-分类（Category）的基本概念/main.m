//
//  main.m
//  08-分类（Category）的基本概念
//
//  Created by wei wei on 2023/10/28.
//

/*
 方法:
 方法的声明:
 方法的实现:
 
 所以: 通过分类给某一个类扩充方法, 也分为声明和实现两个部分
 
 // 分类的声明
 @interface ClassName (CategoryName)
 NewMethod; //在类别中添加方法
 //不允许在类别中添加变量
 @end
 
 ClassName: 需要给哪个类扩充方法
 CategoryName: 分类的名称
 NewMethod: 扩充的方法
 
 // 分类的实现
 @implementation ClassName(CategoryName)
 
 NewMethod
 ... ...
 @end
 
 ClassName: 需要给哪个类扩充方法
 CategoryName: 分类的名称
 NewMethod: 扩充的方法
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Q.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    p.age = 30;
    [p say];
    [p playFootball];
    [p playBasketball];
    return 0;
}
