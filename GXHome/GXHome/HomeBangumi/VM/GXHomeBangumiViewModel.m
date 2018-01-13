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
    @weakify(self);
    GXNetworkManager *manager = [[GXNetworkManager alloc] initWithOptions:options success:^(NSDictionary * _Nullable result, NSURLResponse * _Nullable response) {
        @strongify(self);
        self.objects = [self fakeArray];
    } failure:nil];
    [manager requestAsync];
}

- (NSArray *)fakeArray {
    GXHomeBangumiModel *model = [[GXHomeBangumiModel alloc] initWithTitle:@"title" desc:@"desc" cover:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3625395600,1508684687&fm=27&gp=0.jpg"];
        GXHomeBangumiModel *model1 = [[GXHomeBangumiModel alloc] initWithTitle:@"title1" desc:@"desc1" cover:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3625395600,1508684687&fm=27&gp=0.jpg"];
        GXHomeBangumiModel *model2 = [[GXHomeBangumiModel alloc] initWithTitle:@"title2" desc:@"desc2" cover:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3625395600,1508684687&fm=27&gp=0.jpg"];
    NSArray *fakeArr = @[model,model1,model2];
    return fakeArr;
}

@end
