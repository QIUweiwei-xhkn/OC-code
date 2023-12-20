//
//  Student.m
//  12-自定义构造方法在继承中的表现
//
//  Created by wei wei on 2023/9/25.
//

#import "Student.h"

@implementation Student
-(instancetype)initWithAge:(int)age andName:(NSString *)name andNo:(int)no {
    /*
       if (self = [super init]) {
   //        _age = age;
           // 狗拿耗子, 多管闲事
           // 自己的事情自己做
           [self setAge:age];
           [self setName:name];
       }
        */
    if(self = [super initWithAge:age andName:name]) {
        _no = no;
    }
    return self;
}
-(NSString *)description {
    return [NSString stringWithFormat:@"age = %i, name = %@, no = %i",[self age],[self name],_no];
}
@end
