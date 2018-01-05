//
//  GXHomeFeedCardAVView.h
//  BBPhone
//
//  Created by sgx on 2018/1/2.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GXHomeFeedCardAVView : UIView

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;

+ (NSInteger)getTotalHeight;

@end
