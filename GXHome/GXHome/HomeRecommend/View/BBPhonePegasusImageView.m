//
//  BBPhonePegasusImageView.m
//  BBPhone
//
//  Created by sgx on 2018/1/20.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "BBPhonePegasusImageView.h"

@interface BBPhonePegasusImageView ()

@end

@implementation BBPhonePegasusImageView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setImageWithURL:(NSString *)url size:(CGSize)size {
    if (!url || url.length <= 0) {
        return;
    } else {
        [self gx_setImageWithURL:url];
    }
}

@end
