//
//  GXHomeBaseFeedCardView.m
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "GXHomeBaseFeedCardView.h"

@implementation GXHomeBaseFeedCardView

- (instancetype)init {
    if (self = [super init]) {
        [self configSubviews];
        [self customSubviews];
        [self addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(12));
            make.right.equalTo(@(-12));
            make.bottom.equalTo(self);
            make.height.equalTo(@(0.5));
        }];
    }
    return self;
}

#pragma mark - Subclass Rewrite

- (void)configSubviews {

}

/// 子类自定义各个子控件
- (void)customSubviews {
    
}

#pragma mark - Public Method

- (void)configCoverImage:(NSString *)url size:(CGSize)size {
//    @weakify(self);
//    [self.coverImageView bili_setImageWithURL:[NSURL URLWithString:url] ptSize:[BFCImgUrlKit filterImgRequestPtSizeWith:size] placeholderImage:[UIImage defaultTVImageWithSize:size] completed:^(UIImage *image, NSError *error, BiliWebImageCacheType cacheType, NSURL *imageURL) {
//        @strongify(self);
//        if (!error && cacheType == BiliWebImageCacheNone) {
//            self.coverImageView.alpha = 0.0;
//            [UIView animateWithDuration:0.3 animations:^{
//                self.coverImageView.alpha = PEGASUSSHAREHELPER.pegasusImageAlpha;
//            } completion:nil];
//        }
//    }];
    
}

#pragma mark - Initialize Method

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

- (UILabel *)rcmLabel {
    if (_rcmLabel == nil) {
        _rcmLabel = [[UILabel alloc] init];
        _rcmLabel.textColor = [UIColor whiteColor];
        _rcmLabel.backgroundColor = HEXCOLOR(0xFB9F60);
        _rcmLabel.textAlignment = NSTextAlignmentCenter;
        _rcmLabel.font = [UIFont systemFontOfSize:10];
        _rcmLabel.layer.cornerRadius = 2;
        _rcmLabel.layer.masksToBounds = YES;
    }
    return _rcmLabel;
}

- (UIView *)bottomLine {
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = HEXCOLOR(0x212121);
        _bottomLine.hidden = YES;
    }
    return _bottomLine;
}

@end
