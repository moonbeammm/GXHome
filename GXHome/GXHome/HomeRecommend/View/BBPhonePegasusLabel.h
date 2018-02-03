//
//  BBPhonePegasusLabel.h
//  BBPhone
//
//  Created by sgx on 2018/1/20.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBPhonePegasusLabel : UILabel

@property (nonatomic, strong) NSString *bili_content;
@property (nonatomic, strong) NSString *bili_event;
@property (nonatomic, strong) NSString *bili_bgColor;
@property (nonatomic, strong) NSString *bili_alpha;
@property (nonatomic, strong) NSString *bili_titleColor;

- (void)setTitleWithText:(NSString *)text;

@end
