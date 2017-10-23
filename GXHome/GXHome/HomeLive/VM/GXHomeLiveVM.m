//
//  GXHomeLiveVM.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/20.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeLiveVM.h"
#import <GXNetwork/GXNetwork.h>
#import "GXHomeLiveModel.h"

@implementation GXHomeLiveVM

- (void)loadData
{
    [super loadData];
    GXApiOptions *options = [[GXApiOptions alloc] init];
    options.baseUrl = @"https://api.live.bilibili.com/mobile/rooms";
    options.params = @{@"page":@"1",
                       @"platform":@"ios",
                       @"sort":@"hottest"
                       };
    options.modelDescriptions = @[[GXApiModelDescription modelWith:@"data" mappingClass:[GXHomeLiveModel class] isArray:YES]];
    GXNetworkManager *manager = [[GXNetworkManager alloc] initWithOptions:options success:^(NSDictionary * _Nullable result, NSURLResponse * _Nullable response) {
        self.objects = result[@"data"];
    } failure:^(NSDictionary * _Nullable result, NSError * _Nullable error) {

    }];
    [manager requestAsync];
}

@end
