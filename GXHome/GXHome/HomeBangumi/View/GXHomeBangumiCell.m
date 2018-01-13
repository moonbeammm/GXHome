//
//  GXHomeBangumiCell.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/23.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeBangumiCell.h"
#import <Masonry/Masonry.h>
#import <GXRuler/UIImageView+GXWebImage.h>
#import "GXHomeBangumiModel.h"

@interface GXHomeBangumiCell ()

@property (nonatomic, strong) UIImageView *coverImagView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation GXHomeBangumiCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubviews];
    }
    return self;
}

#pragma mark - Public Method

- (void)installWithModel:(GXHomeBangumiModel *)model params:(NSDictionary *)params {
    [self.coverImagView gx_setImageWithURL:model.cover ptSize:CGSizeZero placeholderImage:nil options:0 progress:nil completed:nil];
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
}

+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return 90;
}

#pragma mark - Event Response

#pragma mark - Private Method

#pragma mark - Initialize Method

- (void)configSubviews {
    [self.contentView addSubview:self.coverImagView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.bottomLine];
    [self.coverImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.top.equalTo(self.contentView).offset(12);
        make.width.equalTo(@(120));
        make.height.equalTo(@(120 * 9 / 16));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImagView.mas_right).offset(12);
        make.top.equalTo(self.coverImagView.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-12);
        make.height.equalTo(@(self.titleLabel.font.lineHeight));
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.height.equalTo(@(self.descLabel.font.lineHeight));
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
    }];
}

- (UIImageView *)coverImagView {
    if (_coverImagView == nil) {
        _coverImagView = [[UIImageView alloc] init];
        _coverImagView.layer.cornerRadius = 4;
        _coverImagView.layer.masksToBounds = YES;
    }
    return _coverImagView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.font = [UIFont systemFontOfSize:13];
    }
    return _descLabel;
}

- (UIView *)bottomLine {
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor grayColor];
    }
    return _bottomLine;
}

@end
