//
//  GXHomeRecSpecialCell.m
//  GXHome
//
//  Created by sgx on 2018/1/7.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecSpecialCell.h"

@implementation GXHomeRecSpecialCell

- (void)installWithModel:(id)model params:(NSDictionary *)params {
    NSString *url = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg";
    [self.coverImageView gx_setImageWithURL:url ptSize:CGSizeZero placeholderImage:nil options:0 progress:nil completed:nil];
}
@end
