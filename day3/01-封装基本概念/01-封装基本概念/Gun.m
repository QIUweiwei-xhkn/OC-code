//
//  Gun.m
//  01-封装基本概念
//
//  Created by wei wei on 2023/9/12.
//

#import "Gun.h"

@implementation Gun
-(void)shoot {
    if (_bullet > 0) {
            _bullet--;
            NSLog(@"打了一枪 , 还剩%i颗子弹", _bullet);
        }else{
            NSLog(@"没有子弹了");
        }
}
-(void)addBulle:(int)count {
    /*
         封装: 屏蔽内部实现的细节, 仅仅对外提供共有的方法/接口
         好处: 保证数据的安全性
               将变化隔离
         规范: 一般情况下不会对外直接暴露成员变量, 都会提供一些共有的方法进行赋值
               成员变量都需要封装起来
         */
        // 对传入的数据进行过滤
    if(count > 0) {
        _bullet = count;
    } else {
        NSLog(@"没有子弹");
    }
}

- (int)getBullet {
    return _bullet;
}
@end
