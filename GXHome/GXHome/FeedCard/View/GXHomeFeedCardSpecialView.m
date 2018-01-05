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
}

- (UIImageView *)coverImageView {
    if (_coverImageView == nil) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.layer.cornerRadius = 5;
        _coverImageView.layer.masksToBounds = YES;
    }
    return _coverImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR(0x212121);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = HEXCOLOR(0x999999);
        _descLabel.font = [UIFont systemFontOfSize:12];
    }
    return _descLabel;
}

@end

