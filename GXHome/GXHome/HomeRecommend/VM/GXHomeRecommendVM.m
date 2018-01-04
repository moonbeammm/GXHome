//
//  GXHomeRecommendVM.m
//  GXHome
//
//  Created by sgx on 2018/1/4.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVM.h"
#import <GXNetwork/GXNetworkManager.h>

@implementation GXHomeRecommendVM

- (void)loadData {
    GXApiOptions *options = [[GXApiOptions alloc] init];
    options.baseUrl = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    [[[GXNetworkManager alloc] initWithOptions:options progress:^(NSProgress * _Nullable downloadProgress) {
        NSLog(@"ViewController: progress: %@",downloadProgress);
    } success:^(NSDictionary * _Nullable result, NSURLResponse * _Nullable response) {
        NSLog(@"ViewController: \ntask: \n%@\nresponseObject:\n%@",result,response);
    } failure:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
        NSLog(@"ViewController: task: %@>>>>error:%@",result,error);
    }] requestAsync];
}

@end
