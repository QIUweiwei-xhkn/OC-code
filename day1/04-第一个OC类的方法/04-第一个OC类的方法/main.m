//
//  main.m
//  04-第一个OC类的方法
//
//  Created by wei wei on 2023/9/10.
//

#import <Foundation/Foundation.h>
typedef enum {
    KICOLORBlack,
    KICOLORWhite,
    KICOLORTuHaoJin,
}IColor;

@interface Iphone : NSObject {
    @public
    float _modle;
    int _cpu;
    IColor _color;
}
// 行为
- (void)about;
- (char *)loadmassage;
- (int)signal:(int)number;
+ (int)sumWithValue1:(int)value1 andValue2:(int)value2;
+ (NSString *)IColorWithNumber:(IColor)number;

@end

@implementation Iphone
// 行为的实现
- (void)about {
    /* NSString *name;
     switch(_color) {
        case 0:
            name = @"黑色";
            break;
        case 1:
            name = @"白色";
            break;
        case 2:
            name = @"土豪金";
            break;
    } */
//    Iphone *p = [Iphone new];
//    NSString *name = [p IColorWithNumber:_color];
    NSString *name = [Iphone IColorWithNumber:_color];
    NSLog(@"打印本机信息");
//    NSLog(@"sum = %d", [Iphone sumWithValue1:10 andValue2:20]);
//    NSLog(@"modle = %f, cpu = %d, color = %d", _modle, _cpu, _color);
    NSLog(@"modle = %f, cpu = %d, color = %@", _modle, _cpu, name);
}

+ (NSString *)IColorWithNumber:(IColor)number {
    NSString *name;
     switch(number) {
        case 0:
            name = @"黑色";
            break;
        case 1:
            name = @"白色";
            break;
        case 2:
            name = @"土豪金";
            break;
         default:
             name = @"华强北";
             break;
    }
    return name;
}

- (char *)loadmassage {
    return "你好中文输出也挺好";
}

- (int)signal:(int)number {
    NSLog(@"打电话给%d", number);
    return 1;
}
// 类方法和对象方法可以相互调用
+ (int)sumWithValue1:(int)value1 andValue2:(int)value2 {
    Iphone *p = [Iphone new];
    [p signal:1234];
    return value1 + value2;
}
@end

int main(int argc, const char * argv[]) {
    Iphone *p = [Iphone new];
    p->_color = KICOLORWhite;
    p->_cpu = 0;
    p->_modle = 4;
//    int res = [Iphone sumWithValue1:10 andValue2:20];
//    NSLog(@"res = %d", res);
    [p about];
    return 0;
}
