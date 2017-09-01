//
//  GXHomeRouter.m
//  GXHome
//
//  Created by sunguangxin on 2017/8/24.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeRouter.h"

@implementation GXHomeRouter

+ (void)initialize
{
    [[GXRouter shared] map:@"home/business/testvc" toControllerClass:[UIViewController class]];
}

@end
