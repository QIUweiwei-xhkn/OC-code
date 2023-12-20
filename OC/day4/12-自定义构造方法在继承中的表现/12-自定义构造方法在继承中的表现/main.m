//
//  main.m
//  12-自定义构造方法在继承中的表现
//
//  Created by wei wei on 2023/9/25.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    Student *stu = [[Student alloc] initWithAge:20 andName:@"Qweiwei" andNo:1];
    NSLog(@"%@",stu);
    return 0;
}
