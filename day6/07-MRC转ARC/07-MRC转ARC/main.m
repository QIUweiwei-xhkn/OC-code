//
//  main.m
//  07-MRC转ARC
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Bone.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    Dog *d = [[Dog alloc] init];
    Bone *b = [[Bone alloc] init];
    
    return 0;
}
