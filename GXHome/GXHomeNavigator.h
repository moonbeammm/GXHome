//
//  GXHomeNavigator.h
//  GXHome
//
//  Created by sunguangxin on 2017/10/20.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXHomeNavigator : NSObject

+ (GXHomeNavigator *)shared;

- (void)showPlayerDetailVCWithUrl:(NSString *)url;
- (void)showVirtualFeedVC;

@end
