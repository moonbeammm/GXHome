//
//  BBPhonePegasusDynamicProtocol.h
//  GXHome
//
//  Created by sgx on 2018/1/25.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//


@protocol BBPhonePegasusDynamicProtocol <NSObject>

- (void)pegasusCell:(id)cell clickView:(UIView *)view eventID:(NSString *)eventID;
- (void)pegasusCell:(id)cell clickMoreActionView:(UIView *)view;

@end
