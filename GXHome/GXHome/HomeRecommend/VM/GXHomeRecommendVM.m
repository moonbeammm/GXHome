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
                     @{
                         @"layout_type": @"bili_music_layout",
                         @"title": @"黑豹30周年纪念专辑",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"uri": @"bilibili://music/menu/detail/10157?from=tianma",
                         @"param": @"10157",
                         @"goto": @"audio",
                         @"idx": @"1472195258",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tags":
                             @{
                                 @"tag_id": @"31878",
                                 @"tag_name": @"声优"
                                 },
                         @"desc": @"孤独巡视333333312312312312312312312312312312313123",
                         @"total":@"...共10000首歌曲",
                         @"face": @"http://i2.hdslb.com/bfs/face/974494432164be49280b38c44a973fc5307596b6.jpg",
                         @"name": @"发财",
                         @"badge": @"音乐",
                         },
                     @{
                         @"layout_type": @"bili_music_layout",
                         @"title": @"黑豹30周年纪念专辑",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"uri": @"bilibili://music/menu/detail/10157?from=tianma",
                         @"param": @"10157",
                         @"goto": @"audio",
                         @"idx": @"1472195258",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tags":
                             @{
                                 @"tag_id": @"31878",
                                 @"tag_name": @"声优"
                                 },
                         @"desc": @"孤独巡视333333312312312312312312312312312312313123",
                         @"total":@"...共10000首歌曲",
                         @"face": @"http://i2.hdslb.com/bfs/face/974494432164be49280b38c44a973fc5307596b6.jpg",
                         @"name": @"发财",
                         @"badge": @"音乐",
                         },
                     @{
                         @"layout_type": @"bili_player_layout",
                         @"goto": @"player",
                         @"item": @{
                                 @"title": @"【Benny】后妈作文课堂开课啦，香水评测说不好，多半是不够作",
                                 @"cover": @"http://i0.hdslb.com/bfs/archive/351d93b51048b59fc988b8d2b660514b80a91203.jpg",
                                 @"uri": @"bilibili://video/14048681",
                                 @"param": @"14048681",
                                 @"goto": @"av",
                                 },
                         @"name": @"暖暖暖暖暖巷",
                         @"face": @"http://i2.hdslb.com/bfs/face/264fb5c916c9841b2ae5987246c788d5304e1710.gif",
                         @"tname": @"MMD·3D",
                         @"duration_str": @"6:03",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tag": @{
                                 @"tag_name": @"剑网三",
                                 },
                         },
                     @{
                         @"title": @"purchase卡片title",
                         @"layout_type": @"bili_purchase_layout",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"goto": @"player",
                         @"item": @{
                                 @"title": @"【Benny】后妈作文课堂开课啦，香水评测说不好，多半是不够作",
                                 @"cover": @"http://i0.hdslb.com/bfs/archive/351d93b51048b59fc988b8d2b660514b80a91203.jpg",
                                 @"uri": @"bilibili://video/14048681",
                                 @"param": @"14048681",
                                 @"goto": @"av",
                                 },
                         @"name": @"暖暖暖暖暖巷",
                         @"face": @"http://i2.hdslb.com/bfs/face/264fb5c916c9841b2ae5987246c788d5304e1710.gif",
                         @"tname": @"MMD·3D",
                         @"duration_str": @"6:03",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tag": @{
                                 @"tag_name": @"剑网三",
                                 },
                         },
                     @{
                         @"layout_type": @"bili_music_layout",
                         @"title": @"黑豹30周年纪念专辑",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"uri": @"bilibili://music/menu/detail/10157?from=tianma",
                         @"param": @"10157",
                         @"goto": @"audio",
                         @"idx": @"1472195258",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tags":
                         @{
                             @"tag_id": @"31878",
                             @"tag_name": @"声优"
                         },
                         @"desc": @"孤独巡视333333312312312312312312312312312312313123",
                         @"total":@"...共10000首歌曲",
                         @"face": @"http://i2.hdslb.com/bfs/face/974494432164be49280b38c44a973fc5307596b6.jpg",
                         @"name": @"发财",
                         @"badge": @"音乐",
                         },
                     @{
                         @"title": @"purchase卡片title",
                         @"layout_type": @"bili_purchase_layout",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"goto": @"player",
                         @"item": @{
                                 @"title": @"【Benny】后妈作文课堂开课啦，香水评测说不好，多半是不够作",
                                 @"cover": @"http://i0.hdslb.com/bfs/archive/351d93b51048b59fc988b8d2b660514b80a91203.jpg",
                                 @"uri": @"bilibili://video/14048681",
                                 @"param": @"14048681",
                                 @"goto": @"av",
                                 },
                         @"name": @"暖暖暖暖暖巷",
                         @"face": @"http://i2.hdslb.com/bfs/face/264fb5c916c9841b2ae5987246c788d5304e1710.gif",
                         @"tname": @"MMD·3D",
                         @"duration_str": @"6:03",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tag": @{
                                 @"tag_name": @"剑网三",
                                 },
                         },
                     @{
                         @"layout_type": @"bili_music_layout",
                         @"title": @"黑豹30周年纪念专辑",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"uri": @"bilibili://music/menu/detail/10157?from=tianma",
                         @"param": @"10157",
                         @"goto": @"audio",
                         @"idx": @"1472195258",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tags":
                             @{
                                 @"tag_id": @"31878",
                                 @"tag_name": @"声优"
                                 },
                         @"desc": @"孤独巡视333333312312312312312312312312312312313123",
                         @"total":@"...共10000首歌曲",
                         @"face": @"http://i2.hdslb.com/bfs/face/974494432164be49280b38c44a973fc5307596b6.jpg",
                         @"name": @"发财",
                         @"badge": @"音乐",
                         },
                     @{
                         @"title": @"purchase卡片title",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"layout_type": @"bili_purchase_layout",
                         @"goto": @"player",
                         @"item": @{
                                 @"title": @"【Benny】后妈作文课堂开课啦，香水评测说不好，多半是不够作",
                                 @"cover": @"http://i0.hdslb.com/bfs/archive/351d93b51048b59fc988b8d2b660514b80a91203.jpg",
                                 @"uri": @"bilibili://video/14048681",
                                 @"param": @"14048681",
                                 @"goto": @"av",
                                 },
                         @"name": @"暖暖暖暖暖巷",
                         @"face": @"http://i2.hdslb.com/bfs/face/264fb5c916c9841b2ae5987246c788d5304e1710.gif",
                         @"tname": @"MMD·3D",
                         @"duration_str": @"6:03",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tag": @{
                                 @"tag_name": @"剑网三",
                                 },
                         },
                     @{
                         @"layout_type": @"bili_music_layout",
                         @"title": @"黑豹30周年纪念专辑",
                         @"cover": @"http://i0.hdslb.com/bfs/bangumi/cbb20ee03e97a9f3ad2e1506a10fd1271f1c584a.jpg",
                         @"uri": @"bilibili://music/menu/detail/10157?from=tianma",
                         @"param": @"10157",
                         @"goto": @"audio",
                         @"idx": @"1472195258",
                         @"playanddanmaku": @"3.4万观看 9879弹幕",
                         @"tags":
                             @{
                                 @"tag_id": @"31878",
                                 @"tag_name": @"声优"
                                 },
                         @"desc": @"孤独巡视333333312312312312312312312312312312313123",
                         @"total":@"...共10000首歌曲",
                         @"face": @"http://i2.hdslb.com/bfs/face/974494432164be49280b38c44a973fc5307596b6.jpg",
                         @"name": @"发财",
                         @"badge": @"音乐",
                         },
                     ];
}

@end
