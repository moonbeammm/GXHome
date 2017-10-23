//
//  GXHomeLiveModel.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/20.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeLiveModel.h"
#import <YYModel/YYModel.h>

@implementation GXHomeLiveCoverModel
- (id)copyWithZone:(NSZone *)zone
{
    return [self yy_modelCopy];
}
@end

@implementation GXHomeLiveModel
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
             @"cover":[GXHomeLiveCoverModel class]
             };
}
@end
