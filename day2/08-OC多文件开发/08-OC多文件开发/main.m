//
//  main.m
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Soldier.h"
#import "Shop.h"
int main(int argc, const char * argv[]) {
    // 1.创建士兵
        Soldier *sp =[Soldier new];
        sp->_name = @"哈哈";
        sp->_height = 1.88;
        sp->_weight = 100.0;
        
        // 2.购买手枪
        Gun *gp = [Shop buyGun:888];
        
        // 3.购买弹夹
        Clip *clip = [Shop buyClip:100];

        // 4.让士兵开枪
        [sp fire:gp clip:clip];
        [sp fire:gp clip:clip];
>>>>>>> main
    return 0;
}
