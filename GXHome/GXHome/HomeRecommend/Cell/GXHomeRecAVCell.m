//
//  GXHomeRecAVCell.m
//  GXHome
//
//  Created by sunguangxin on 2018/1/5.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecAVCell.h"
#import "GXHomeFeedCardAVView.h"

@interface GXHomeRecAVCell ()

@property (nonatomic, strong) GXHomeFeedCardAVView *avView;

@end

@implementation GXHomeRecAVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.avView = [GXHomeFeedCardAVView new];
        [self.contentView addSubview:self.avView];
        [self.avView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)installWithModel:(id)model params:(NSDictionary *)params {
    [self.avView.coverImageView gx_setImageWithURL:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3625395600,1508684687&fm=27&gp=0.jpg" ptSize:self.avView.coverImageView.frame.size placeholderImage:nil options:0 progress:nil completed:nil];
    self.avView.titleLabel.text = @"我是title!!";
    self.avView.descLabel.text = @"我是desc!!";
}

+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return [GXHomeFeedCardAVView getTotalHeight];
}

@end
