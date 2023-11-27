//
//  main.m
//  05-NSArray文件读写
//
//  Created by wei wei on 2023/11/26.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    // 1.将数组写入到文件中
    /*
     NSArray *arr = @[@"qww", @"QWW", @"Q", @"ww"];
     // 其实如果将一个数组写入到文件中之后, 本质是写入了一个XML文件
     // 在iOS开发中一般情况下我们会将XML文件的扩展名保存为plist
     BOOL flag = [arr writeToFile:@"/Users/weiwei/Desktop/ios-basic/day8/05-NSArray文件读写/05-NSArray文件读写/ha.plist" atomically:YES];
     NSLog(@"flag = %i", flag);
     */
    
    // 2.从文件中读取一个数组
    NSArray *newArr = [NSArray arrayWithContentsOfFile:@"/Users/weiwei/Desktop/ios-basic/day8/05-NSArray文件读写/05-NSArray文件读写/ha.plist"];
    NSLog(@"newArr =  %@", newArr);
    
    Person *p1 = [Person new];
    p1.age = 10;
    Person *p2 = [Person new];
    p2.age = 20;
    Person *p3 = [Person new];
    p3.age = 5;
    Person *p4 = [Person new];
    p4.age = 7;
    
    NSArray *arr = @[p1, p2, p3, p4];
    //     注意:writeToFile只能写入数组中保存的元素都是Foundation框架中的类创建的对象, 如果保存的是自定义对象那么不能写入
    BOOL flag = [arr writeToFile:@"/Users/weiwei/Desktop/ios-basic/day8/05-NSArray文件读写/05-NSArray文件读写/Perosn.plist" atomically:YES];
    NSLog(@"flag = %i", flag);
    return 0;
}
