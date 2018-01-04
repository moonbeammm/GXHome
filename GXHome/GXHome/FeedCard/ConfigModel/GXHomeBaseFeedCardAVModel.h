//
//  GXHomeBaseFeedCardAVModel.h
//  GXHome
//
//  Created by sunguangxin on 2018/1/4.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GXHomeUIImageViewModel.h"
#import "GXHomeUILabelModel.h"

@interface GXHomeBaseFeedCardAVModel : NSObject

@property (nonatomic, assign) NSInteger cellHeight;
@property (nonatomic, strong) GXHomeUIImageViewModel *coverImageView;
@property (nonatomic, strong) GXHomeUILabelModel *titleLabel;
@property (nonatomic, strong) GXHomeUILabelModel *descLabel;

+ (instancetype)share;

@end
