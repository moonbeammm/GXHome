//
//  GXHomeRecSpecialCell.m
//  GXHome
//
//  Created by sgx on 2018/1/7.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecSpecialCell.h"

@implementation GXHomeRecSpecialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.coverImageView = [[GXImageView alloc] init];
        self.coverImageView.content = @"cover";
        [self.contentView addSubview:self.coverImageView];
        [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@(12));
            make.right.equalTo(@(-12));
            make.height.equalTo(self.coverImageView.mas_width).multipliedBy(140/94.0);
            make.bottom.equalTo(@(-12));
        }];
    }
    return self;
}

@end
