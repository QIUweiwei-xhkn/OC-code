//
//  Student.h
//  05-代理设计模式练习
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
//#import "studentProtocol.h"
NS_ASSUME_NONNULL_BEGIN

/*
 协议的编写规范:
 1.一般情况下, 当前协议属于谁, 我们就将协议定义到谁的头文件中
 2.协议的名称一般以它属于的那个类的类名开头, 后面跟上protocol或者delegate
 3.协议中的方法名称一般以协议的名称protocol之前的作为开头
 4.一般情况下协议中的方法会将触发该协议的对象传递出去
 
 5.一般情况下一个类中的代理属于的名称叫做 delegate
 
 6.当某一个类要成为另外一个类的代理的时候,
   一般情况下在.h中用@protocol 协议名称;告诉当前类 这是一个协议.
    在.m中用#import真正的导入一个协议的声明
 */
@class Student;
@protocol studentProtocol <NSObject>

-(void)studentFindHouse:(Student *)student;

@end

@interface Student : NSObject
@property (nonatomic, strong) id<studentProtocol> delegete;
- (void)findHourse;
@end

NS_ASSUME_NONNULL_END
