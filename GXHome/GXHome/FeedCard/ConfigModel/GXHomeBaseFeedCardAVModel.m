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
        NSData *jsonData = [NSData dataWithContentsOfFile:kLibraryDirectory(@"card_model.json")];
        NSDictionary *root_dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dict = root_dict[@"data"];
        _instance = [GXHomeBaseFeedCardAVModel yy_modelWithDictionary:dict];
    });
    return _instance;
}

- (NSInteger)gx_transfer:(NSString *)str {
    if (![str containsString:@"="]) {
        return [str integerValue];
    }
    NSArray *arrs = [str componentsSeparatedByString:@"+"];
    NSString *comp = arrs[0];
    if ([comp isEqualToString:@"minscreen"]) {
        
    }
    return 0;
}

@end

