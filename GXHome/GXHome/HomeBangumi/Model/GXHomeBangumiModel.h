//
//  GXHomeBangumiModel.h
//  GXHome
//
//  Created by sunguangxin on 2017/10/23.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXHomeBangumiModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *desc;

- (instancetype)initWithTitle:(NSString *)title desc:(NSString *)desc cover:(NSString *)cover;

@end
