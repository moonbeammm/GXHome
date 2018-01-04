//
//  GXHomeFeedCardGameView.m
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "GXHomeFeedCardGameView.h"

@implementation GXHomeFeedCardGameView

#pragma mark - Initialize Method

- (void)configSubviews {
    [self addSubview:self.coverImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.rateLabel];
    [self addSubview:self.reserveLabel];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(12));
        make.bottom.equalTo(@(-12));
        make.width.height.equalTo(@(40));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).offset(10);
        make.top.equalTo(@(14));
        make.height.equalTo(@(14));
        make.right.equalTo(self).offset(-12);
    }];
    [self.rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left).offset(4);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(12);
        make.width.equalTo(@(45));
        make.height.equalTo(@(12));
    }];
    [self.reserveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rateLabel.mas_right).offset(8);
        make.centerY.equalTo(self.rateLabel.mas_centerY);
        make.height.equalTo(@(12));
        make.right.equalTo(self).offset(-12);
    }];
}

- (void)customSubviews {
    self.coverImageView.layer.cornerRadius = 4;
    self.titleLabel.numberOfLines = 1;
}

- (UILabel *)rateLabel {
    if (_rateLabel == nil) {
        _rateLabel = [[UILabel alloc] init];
        _rateLabel.textColor = HEXCOLOR(0x999999);
        _rateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _rateLabel;
}

- (UILabel *)reserveLabel {
    if (_reserveLabel == nil) {
        _reserveLabel = [[UILabel alloc] init];
        _reserveLabel.textColor = HEXCOLOR(0x999999);
        _reserveLabel.font = [UIFont systemFontOfSize:12];
    }
    return _reserveLabel;
}

@end
