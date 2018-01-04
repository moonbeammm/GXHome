//
//  GXHomeBaseFeedCardView.h
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GXHomeBaseFeedCardView : UIView

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *rcmLabel;
@property (nonatomic, strong) UIView *bottomLine;

/// 子类自定义添加和布局子控件
- (void)configSubviews;
/// 子类自定义各个子控件
- (void)customSubviews;
/// 更新封面图片
- (void)configCoverImage:(NSString *)url size:(CGSize)size;

@end
