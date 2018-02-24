//
//  GXHomeNavigator.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/20.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeNavigator.h"
#import <GXPlayer/GXPlayerDetailVC.h>
#import <GXRuler/GXRouter.h>

@implementation GXHomeNavigator

+ (GXHomeNavigator *)shared
{
    static dispatch_once_t onceToken;
    static GXHomeNavigator * shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[GXHomeNavigator alloc] init];
    });
    return shared;
}

- (void)showPlayerDetailVCWithUrl:(NSString *)url
{
    GXPlayerDetailVC *vc = [[GXPlayerDetailVC alloc] initWithUrl:url];
    [[GXRouter navigationController] pushViewController:vc animated:YES];
}

@end
