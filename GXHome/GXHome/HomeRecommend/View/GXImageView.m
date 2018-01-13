//
//  GXImageView.m
//  GXHome
//
//  Created by sgx on 2018/1/13.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXImageView.h"

@implementation GXImageView

- (void)setContentWithModel:(NSString *)model {
    [self gx_setImageWithURL:model ptSize:CGSizeZero placeholderImage:nil options:0 progress:nil completed:nil];
}

@end
