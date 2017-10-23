//
//  GXHomeBangumiViewModel.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/23.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeBangumiViewModel.h"
#import <GXNetwork/GXNetwork.h>
#import "GXHomeBangumiModel.h"

@implementation GXHomeBangumiViewModel

- (void)loadData
{
    [super loadData];
    GXApiOptions *options = [[GXApiOptions alloc] init];
    options.baseUrl = @"http://www.sunxxxxx.com/sgx/app_rank_origin";
    options.modelDescriptions = @[[GXApiModelDescription modelWith:@"data" mappingClass:[GXHomeBangumiModel class] isArray:YES]];
    GXNetworkManager *manager = [[GXNetworkManager alloc] initWithOptions:options success:^(NSDictionary * _Nullable result, NSURLResponse * _Nullable response) {
        self.objects = result[@"data"];
        NSLog(@"孙广鑫%@",result);
    } failure:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
        NSLog(@"孙广鑫%@",result);
    }];
    [manager requestAsync];
}

@end
