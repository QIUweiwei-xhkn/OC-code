//
//  Person.h
//  day16
//
//  Created by xiaomage on 15/6/26.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    double _weigth;
}
@property (nonatomic, assign) int age;

- (void)say;
@end
