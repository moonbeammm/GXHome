//
//  GXHomeUIBaseModel.h
//  GXHome
//
//  Created by sunguangxin on 2018/1/4.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXHomeUIBaseModel : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, assign) NSInteger w;
@property (nonatomic, assign) NSInteger h;
@property (nonatomic, assign) NSInteger cornerRadius;
@property (nonatomic, assign) BOOL maskToBounds;

@end
