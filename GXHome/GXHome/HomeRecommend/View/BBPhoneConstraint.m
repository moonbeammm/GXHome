//
//  BBPhoneConstraint.m
//  GXHome
//
//  Created by sgx on 2018/5/26.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "BBPhoneConstraint.h"

@implementation BBPhoneConstraint

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"sgx ->>>> constraint");
    }
    return self;
}

+ (instancetype)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    NSLog(@"sgx >>> ");
    return [super constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:c];
}

@end
