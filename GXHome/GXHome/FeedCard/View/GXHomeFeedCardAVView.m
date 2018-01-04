//
//  GXHomeFeedCardAVView.m
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "GXHomeFeedCardAVView.h"

@implementation GXHomeFeedCardAVView

#pragma mark - Initialize Method

- (void)configSubviews {
    [self addSubview:self.coverImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.upImageView];
    [self addSubview:self.upLabel];
    [self addSubview:self.playImageView];
    [self addSubview:self.playLabel];
    [self addSubview:self.danmakuImageView];
    [self addSubview:self.danmakuLabel];
    [self addSubview:self.rcmdLabel];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.top.equalTo(@9);
        make.bottom.equalTo(@-10);
        make.width.equalTo(self.coverImageView.mas_height).multipliedBy(1.61);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).offset(12);
        make.top.equalTo(self.coverImageView);
        make.right.equalTo(self).offset(-12);
    }];
    
    [self.playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.coverImageView);
        make.left.equalTo(self.titleLabel);
        make.height.equalTo(@12);
    }];
    [self.playLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.playImageView.mas_right).offset(6);
        make.centerY.equalTo(self.playImageView);
    }];
    [self.danmakuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.playLabel.mas_right).offset(18);
        make.bottom.equalTo(self.playImageView);
        make.height.equalTo(@12);
    }];
    [self.danmakuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.danmakuImageView.mas_right).offset(6);
        make.centerY.equalTo(self.danmakuImageView);
    }];
    [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.playImageView.mas_top).offset(-3);
        make.left.equalTo(self.titleLabel);
        make.height.equalTo(@12);
        make.width.equalTo(@(14));
    }];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.upImageView.mas_right).offset(6);
        make.centerY.equalTo(self.upImageView);
        make.right.equalTo(self.mas_right).offset(-5);
    }];
    [self.rcmdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.coverImageView);
        make.left.equalTo(self.titleLabel);
        make.height.equalTo(@(13));
    }];
}

- (UIImageView *)upImageView {
    if (!_upImageView) {
        _upImageView = [[UIImageView alloc] init];
        _upImageView.image = [UIImage imageNamed:@"feed_card_upper_icon"];
    }
    return _upImageView;
}

- (UILabel *)upLabel {
    if (!_upLabel) {
        _upLabel = [[UILabel alloc] init];
        _upLabel.textColor = HEXCOLOR(0x999999);
        _upLabel.font = [UIFont systemFontOfSize:11];
    }
    return _upLabel;
}

- (UIImageView *)playImageView {
    if (!_playImageView) {
        _playImageView = [[UIImageView alloc] init];
        _playImageView.image = [UIImage imageNamed:@"feed_card_play_icon"];
    }
    return _playImageView;
}

- (UILabel *)playLabel {
    if (!_playLabel) {
        _playLabel = [[UILabel alloc] init];
        _playLabel.textColor = HEXCOLOR(0x999999);
        _playLabel.font = [UIFont systemFontOfSize:11];
    }
    return _playLabel;
}

- (UIImageView *)danmakuImageView {
    if (!_danmakuImageView) {
        _danmakuImageView = [[UIImageView alloc] init];
        _danmakuImageView.image = [UIImage imageNamed:@"feed_card_danmaku_icon"];
    }
    return _danmakuImageView;
}

- (UILabel *)danmakuLabel {
    if (!_danmakuLabel) {
        _danmakuLabel = [[UILabel alloc] init];
        _danmakuLabel.textColor = HEXCOLOR(0x999999);
        _danmakuLabel.font = [UIFont systemFontOfSize:11];
    }
    return _danmakuLabel;
}

- (UILabel *)rcmdLabel {
    if (_rcmdLabel == nil) {
        _rcmdLabel = [[UILabel alloc] init];
        _rcmdLabel.textColor = [UIColor whiteColor];
        _rcmdLabel.backgroundColor = HEXCOLOR(0xFB9F60);
        _rcmdLabel.textAlignment = NSTextAlignmentCenter;
        _rcmdLabel.font = [UIFont systemFontOfSize:10];
        _rcmdLabel.layer.cornerRadius = 2;
        _rcmdLabel.layer.masksToBounds = YES;
    }
    return _rcmdLabel;
}

@end
