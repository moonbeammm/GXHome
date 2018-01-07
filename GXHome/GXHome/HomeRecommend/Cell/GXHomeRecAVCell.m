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
    [self.avView.coverImageView gx_setImageWithURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg" ptSize:self.avView.coverImageView.frame.size placeholderImage:nil options:0 progress:nil completed:nil];
    self.avView.titleLabel.text = @"我是title!!";
    self.avView.descLabel.text = @"我是desc!!";
}

+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return [GXHomeFeedCardAVView getTotalHeight];
}

@end
