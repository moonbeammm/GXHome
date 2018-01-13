//
//  GXHomeRecommendVM.m
//  GXHome
//
//  Created by sgx on 2018/1/4.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVM.h"
#import <GXNetwork/GXNetworkManager.h>

@implementation GXHomeRecommendVM

- (void)loadData {
    self.objects = @[
                     @{@"className":@"GXHomeRecSpecialCell",
                       @"titleStr":@"firsttitleStr1",
                       @"descStr":@"descStr1",
                       @"cover":@"http://t2.hddhhn.com/uploads/tu/201508/38/1.jpg",
                       },
                     @{@"className":@"GXHomeRecGameCell",
                       @"titleStr":@"firsttitleStr2",
                       @"descStr":@"descStr2",
                       @"cover":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg",
                       },
                     @{@"className":@"GXHomeRecGameCell",
                       @"titleStr":@"firsttitleStr3",
                       @"descStr":@"descStr3",
                       @"cover":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg",
                       },
                     @{@"className":@"GXHomeRecGameCell",
                       @"titleStr":@"firsttitleStr4",
                       @"descStr":@"descStr4",
                       @"cover":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg",
                       },
                     @{@"className":@"GXHomeRecGameCell",
                       @"titleStr":@"firsttitleStr5",
                       @"descStr":@"descStr5",
                       @"cover":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg",
                       },
                     @{@"className":@"GXHomeRecGameCell",
                       @"titleStr":@"firsttitleStr6",
                       @"descStr":@"descStr666",
                       @"cover":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg",
                       },
                     @{@"className":@"GXHomeRecGameCell",
                       @"titleStr":@"firsttitleStr777",
                       @"descStr":@"descStr777",
                       @"cover":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515317389190&di=6cc1e455dbb9a221d40ecfc78d1d24ee&imgtype=0&src=http%3A%2F%2Fol.tgbus.com%2Fyxq%2FUploadFiles_1329%2F201205%2F20120524153039452.jpg",
                       },
                     ];
}



@end
