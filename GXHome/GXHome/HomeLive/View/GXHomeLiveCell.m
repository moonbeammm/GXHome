//
//  GXHomeLiveCell.m
//  GXHome
//
//  Created by sunguangxin on 2017/10/20.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeLiveCell.h"
#import "GXHomeLiveModel.h"
#import <Masonry/Masonry.h>
#import <GXRuler/UIImageView+GXWebImage.h>


@interface GXHomeLiveCell ()

@property (nonatomic, strong) GXHomeLiveModel *data;
@property (nonatomic, strong) UIImageView *coverImagView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation GXHomeLiveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubviews];
    }
    return self;
}

- (void)installWithModel:(GXHomeLiveModel *)model params:(NSDictionary *)params {
    self.data = model;
    [self.coverImagView gx_setImageWithURL:model.cover.src ptSize:CGSizeZero placeholderImage:nil options:0 progress:nil completed:nil];
    self.titleLabel.text = model.title;
    self.descLabel.text = model.area_v2_name;
}

+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    NSInteger coverWidth = [UIScreen mainScreen].bounds.size.width - 24;
    NSInteger coverHeight = coverWidth * 9 / 16;
    return coverHeight + 60;
}


#pragma mark - Event Response

#pragma mark - Private Method

#pragma mark - Initialize Method

- (void)configSubviews {
    [self.contentView addSubview:self.coverImagView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descLabel];
    
    NSInteger coverWidth = [UIScreen mainScreen].bounds.size.width - 24;
    [self.coverImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(12));
        make.width.equalTo(@(coverWidth));
        make.top.equalTo(self.contentView).offset(5);
        make.height.equalTo(@(coverWidth * 9 / 16));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.coverImagView);
        make.top.equalTo(self.coverImagView.mas_bottom).offset(5);
        make.height.equalTo(@(20));
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.coverImagView);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.height.equalTo(@(20));
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

@end
