//
//  GXHomeBaseFeedCardAVModel.m
//  GXHome
//
//  Created by sunguangxin on 2018/1/4.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeBaseFeedCardAVModel.h"


static id _instance;

@implementation GXHomeBaseFeedCardAVModel

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"av_card_of_375"];
        _instance = [GXHomeBaseFeedCardAVModel yy_modelWithDictionary:dict];
    });
    return _instance;
}

@end

