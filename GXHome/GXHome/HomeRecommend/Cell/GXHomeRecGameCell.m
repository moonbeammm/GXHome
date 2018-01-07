//
//  GXHomeRecGameCell.m
//  GXHome
//
//  Created by sgx on 2018/1/6.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecGameCell.h"

@implementation GXHomeRecGameCell

- (void)installWithModel:(id)model params:(NSDictionary *)params {
    NSString *url = @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3625395600,1508684687&fm=27&gp=0.jpg";
    [self.coverImageView gx_setImageWithURL:url ptSize:CGSizeZero placeholderImage:nil options:0 progress:nil completed:nil];
}

+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return 200;
}

@end
