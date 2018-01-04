//
//  GXHomeFeedCardSpecialView.m
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "GXHomeFeedCardSpecialView.h"

@implementation GXHomeFeedCardSpecialView

#pragma mark - Initialize Method

- (void)configSubviews {
    [self addSubview:self.coverImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descLabel];
    [self addSubview:self.rcmLabel];
    
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.top.equalTo(@10);
        make.bottom.equalTo(@-10);
        make.width.equalTo(self.coverImageView.mas_height).multipliedBy(1.61);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).offset(12);
        make.top.equalTo(self.coverImageView).offset(2);
        make.right.equalTo(self.mas_right).offset(-12);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-6);
        make.left.equalTo(self.titleLabel.mas_left);
        make.height.equalTo(@(12));
        make.bottom.equalTo(self.rcmLabel.mas_top).offset(-4);
    }];
    [self.rcmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.height.equalTo(@(13));
        make.bottom.equalTo(self.coverImageView.mas_bottom).offset(-3);
    }];
}

@end

