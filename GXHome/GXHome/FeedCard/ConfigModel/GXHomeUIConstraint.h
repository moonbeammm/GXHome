//
//  GXHomeUIConstraint.h
//  GXHome
//
//  Created by sgx on 2018/1/6.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXHomeUIConstraint : NSObject

@property (nonatomic, assign) NSInteger firstItemTag;
@property (nonatomic, assign) NSInteger secondItemTag;

@property (nonatomic, strong) NSString *firstAttribute;
@property (nonatomic, strong) NSString *secondAttribute;

@end
