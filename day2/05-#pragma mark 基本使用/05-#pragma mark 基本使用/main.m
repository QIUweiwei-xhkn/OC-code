//
//  main.m
//  05-#pragma mark 基本使用
//
//  Created by wei wei on 2023/9/11.
//

#import <Foundation/Foundation.h>

/*
 士兵
 事物名称: 士兵(Soldier)
 属性:姓名(name), 身高(height), 体重(weight)
 行为:打枪(fire), 打电话(callPhone)
 
 枪
 事物名称:枪(Gun)
 属性:弹夹(clip) , 型号(model)
 行为:上弹夹(addClip)
 
 弹夹
 事物名称: 弹夹(Clip)
 属性:子弹(Bullet)
 行为:上子弹(addBullet)
 */

//#pragma mark -
//#pragma mark 枪
#pragma mark - 枪
@interface Gun : NSObject {
    @public
    int _bullet;
    
}
-(void)shoot;
@end

@implementation Gun
-(void)shoot{
    // 判断是否有子弹
    if(_bullet > 0) {
        _bullet--;
        NSLog(@"打了一枪,还剩%i个子弹",_bullet);
    }else {
        NSLog(@"没有子弹了, 请换弹夹");
    }
    
}
@end

//#pragma mark -
//#pragma mark 士兵
#pragma mark - 士兵
@interface Solider : NSObject {
    @public
    NSString *_name;
    float _height;
    float _weight;
}
-(void)fire:(Gun *)g;
-(void)callPhone:(int)number;
@end

@implementation Solider
-(void)fire:(Gun *)g {
//    NSLog(@"打了一枪");
    [g shoot];
    
}
-(void)callPhone:(int)number{
    
}
@end

//#pragma mark -
//#pragma mark  程序入口
#pragma mark - 程序入口
int main(int argc, const char * argv[]) {
    // 1.创建一个士兵
    Solider *sp =[Solider new];
    sp->_name = @"哈哈";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    // 2.让士兵开枪
    //    [sp fire];
    Gun *gp  =[Gun new];
    gp->_bullet = 3;
    // 让对象作为方法的参数传递
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    return 0;
}
