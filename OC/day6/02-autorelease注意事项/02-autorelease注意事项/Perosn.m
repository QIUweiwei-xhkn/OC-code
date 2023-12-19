//
//  Perosn.m
//  02-autorelease注意事项
//
//  Created by wei wei on 2023/10/22.
//

#import "Perosn.h"

@implementation Perosn
- (void)run
{
    NSLog(@"%s", __func__);
}
- (void)dealloc
{
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
