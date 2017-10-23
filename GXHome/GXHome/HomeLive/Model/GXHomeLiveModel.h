//
//  GXHomeLiveModel.h
//  GXHome
//
//  Created by sunguangxin on 2017/10/20.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GXNetwork/GXApiModelProtocol.h>

@interface GXHomeLiveCoverModel : NSObject <NSCopying>

@property (nonatomic, copy) NSString *src;

@end

@interface GXHomeLiveModel : NSObject

@property (nonatomic, copy) GXHomeLiveCoverModel *cover;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *area_v2_name;
@property (nonatomic, copy) NSString *playurl;

@end
