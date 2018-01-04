//
//  GXHomeFeedCardAVView.m
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "GXHomeFeedCardAVView.h"
#import "GXHomeBaseFeedCardAVModel.h"

@interface GXHomeFeedCardAVView ()

@property (nonatomic, strong) GXHomeBaseFeedCardAVModel *avModel;

@end

@implementation GXHomeFeedCardAVView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.avModel = [GXHomeBaseFeedCardAVModel share];
        [self configSubviews];
    }
    return self;
}

+ (NSInteger)getTotalHeight {
    return [GXHomeBaseFeedCardAVModel share].cellHeight;
}

#pragma mark - Initialize Method

- (void)configSubviews {
    [self addSubview:self.coverImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descLabel];
    self.coverImageView.frame = CGRectMake(self.avModel.coverImageView.x,
                                           self.avModel.coverImageView.y,
                                           self.avModel.coverImageView.w,
                                           self.avModel.coverImageView.h);
    self.titleLabel.frame = CGRectMake(self.avModel.titleLabel.x,
                                       self.avModel.titleLabel.y,
                                       self.avModel.titleLabel.w,
                                       self.avModel.titleLabel.h);
    self.descLabel.frame = CGRectMake(self.avModel.descLabel.x,
                                      self.avModel.descLabel.y,
                                      self.avModel.descLabel.w,
                                      self.avModel.descLabel.h);
}

- (UIImageView *)coverImageView {
    if (_coverImageView == nil) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.layer.cornerRadius = self.avModel.coverImageView.cornerRadius;
        _coverImageView.layer.masksToBounds = self.avModel.coverImageView.maskToBounds;
    }
    return _coverImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR(self.avModel.titleLabel.hexColor);
        _titleLabel.font = [UIFont systemFontOfSize:self.avModel.titleLabel.font];
        _titleLabel.numberOfLines = self.avModel.titleLabel.numberOfLines;
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = HEXCOLOR(self.avModel.descLabel.hexColor);
        _descLabel.font = [UIFont systemFontOfSize:self.avModel.descLabel.font];
    }
    return _descLabel;
}

@end

