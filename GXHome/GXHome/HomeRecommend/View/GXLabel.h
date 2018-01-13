//
//  GXLabel.h
//  GXHome
//
//  Created by sgx on 2018/1/13.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GXLabel : UILabel

@property (nonatomic, strong) NSString *content;
- (void)setContentWithModel:(NSString *)model;

@end
