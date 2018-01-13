//
//  GXHomeBangumiModel.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/23.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeBangumiModel.h"

@implementation GXHomeBangumiModel

- (instancetype)initWithTitle:(NSString *)title desc:(NSString *)desc cover:(NSString *)cover {
    if (self = [super init]) {
        self.title = title;
        self.desc = desc;
        self.cover = cover;
    }
    return self;
}

@end
