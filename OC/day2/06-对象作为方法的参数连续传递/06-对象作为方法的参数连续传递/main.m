//
//  main.m
//  06-对象作为方法的参数连续传递
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

#pragma mark - 弹夹
@interface Clip: NSObject {
@public
    int _bullet; // 子弹
}
-(void)addBullet;
@end
@implementation Clip
-(void)addBullet{
    _bullet = 10;
}
@end

//#pragma mark -
//#pragma mark 枪
#pragma mark - 枪
@interface Gun : NSObject
{
@public
    int _bullet; // 子弹
}

// 射击
- (void)shoot;
// 注意: 在企业级开发中千万不要随意修改一个方法
// 想要射击必须传递一个弹夹
- (void)shoot:(Clip *)c;

@end

@implementation Gun

- (void)shoot
{
    // 判断是否有子弹
    if (_bullet > 0) {

        _bullet--;
        NSLog(@"打了一枪 %i", _bullet);
    }else
    {
        NSLog(@"没有子弹了, 请换弹夹");
    }
}

- (void)shoot:(Clip *)c {
    //判断有没有弹夹
    if(c != nil) {
        // 判断有没有弹夹
        if(c != nil) {
            // 判断有没有子弹
            if(c->_bullet > 0) {
                c->_bullet--;
                NSLog(@"打了一枪 还剩%i个子弹", c->_bullet);
            }else
            {
                NSLog(@"没有弹夹, 请换弹夹");
            }

        }else {
            NSLog(@"没有弹夹, 请换弹夹");
        }
    }
}
@end


//#pragma mark -
//#pragma mark 士兵
#pragma mark - 士兵
@interface Soldier : NSObject
{
@public
    NSString *_name;
    double _height;
    double _weight;
}
//- (void)fire;
- (void)fire:(Gun *)gun;
- (void)fire:(Gun *)g clip:(Clip *)c;
@end

@implementation Soldier
- (void)fire:(Gun *)g clip:(Clip *)c {
//    [g shoot:c];
    // 判断是否有枪和子弹
    if(g != nil && c != nil) {
        [g shoot:c];
    }
}
/*
 - (void)fire
 {
 NSLog(@"打了一枪");
 }
 */

//  Gun * g = gp
- (void)fire:(Gun *)g
{
    //    NSLog(@"打了一枪");
    [g shoot];
}


@end

//#pragma mark -
//#pragma mark  程序入口
#pragma mark - 程序入口
int main(int argc, const char * argv[]) {
    
    // 1.创建士兵
    Soldier *sp =[Soldier new];
    sp->_name = @"哈哈";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    
    // 2.创建一把枪
    Gun *gp = [Gun new];
    gp->_bullet = 10;
    
    // 2.让士兵开枪
    //    [sp fire];
    
    // 3.创建弹夹
    Clip *c = [Clip new];
    [c addBullet];
    // 让对象作为方法的参数传递
//    [sp fire:gp]; // 地址
//    [sp fire:gp];
//    [sp fire:gp];
//    [sp fire:gp];
//    [sp fire:gp];
//    [sp fire:gp];
    [sp fire:gp clip:c];
    
    return 0;
}
