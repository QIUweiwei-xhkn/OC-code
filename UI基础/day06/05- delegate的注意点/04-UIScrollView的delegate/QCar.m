//
//  QCar.m
//  04-UIScrollView的delegate
//
//  Created by wei wei on 2024/2/12.
//

#import "QCar.h"
@interface QCar () 

@end

@implementation QCar
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
}

- (void)dealloc
{
    NSLog(@"dealloc--车挂了");
}
@end
