//
//  BBPhonePegasusCollectionCell.h
//  GXHome
//
//  Created by sgx on 2018/1/25.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 基础控件
#import "BBPhonePegasusView.h"
#import "BBPhonePegasusImageView.h"
#import "BBPhonePegasusLabel.h"

#import "BBPhonePegasusDynamicProtocol.h"

@interface BBPhonePegasusCollectionCell : UICollectionViewCell

@property (nonatomic, weak) id<BBPhonePegasusDynamicProtocol> delegate;

@property (nonatomic, strong) NSString *bili_content;
@property (nonatomic, strong) NSString *bili_event;
@property (nonatomic, strong) NSString *bili_bgColor;
@property (nonatomic, strong) NSString *bili_alpha;
@property (nonatomic, strong) NSString *bili_type;

- (void)installCellWithDict:(NSDictionary *)dict;
@end
