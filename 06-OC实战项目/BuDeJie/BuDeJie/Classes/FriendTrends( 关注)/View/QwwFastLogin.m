//
//  QwwFastLogin.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/14.
//

#import "QwwFastLogin.h"

@implementation QwwFastLogin

+ (instancetype)fastLogin {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
@end
