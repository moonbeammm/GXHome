//
//  BBPhonePegasusCell.h
//  BBPhone
//
//  Created by sgx on 2018/1/22.
//  Copyright © 2018年 gx. All rights reserved.
//

#import <UIKit/UIKit.h>
/// 基础控件
#import "BBPhonePegasusView.h"
#import "BBPhonePegasusImageView.h"
#import "BBPhonePegasusLabel.h"
#import "BBPhonePegasusDynamicProtocol.h"


@interface BBPhonePegasusCell : UITableViewCell

@property (nonatomic, weak) id<BBPhonePegasusDynamicProtocol> delegate;

@property (nonatomic, strong) NSString *bili_content;
@property (nonatomic, strong) NSString *bili_event;
@property (nonatomic, strong) NSString *bili_bgColor;
@property (nonatomic, strong) NSString *bili_alpha;

- (void)installCellWithDict:(NSDictionary *)dict;

@end
