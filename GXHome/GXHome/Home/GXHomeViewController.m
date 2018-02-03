//
//  GXHomeViewController.m
//  GXHome
//
//  Created by sunguangxin on 2017/8/14.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeViewController.h"

#import <GXPageView/GXPageView.h>
#import "GXHomeRecommendVC.h"
#import "GXHomeRecommendVCV2.h"
#import "GXHomeLiveVC.h"
#import "GXHomeBangumiVC.h"
#import "BBPhonePegasusDataParser.h"

#import <GXRuler/GXImageManager.h>

@interface GXHomeViewController () <GXPageContainerChildVCDelegate>

@property (nonatomic, strong) GXPageContainerView *pageContainerView;
//@property (nonatomic, strong) GXHomeRecommendVC *recommendVC;
@property (nonatomic, strong) GXHomeRecommendVCV2 *recommendVC;
@property (nonatomic, strong) GXHomeLiveVC *liveVC;
@property (nonatomic, strong) GXHomeBangumiVC *bangumiVC;

@end

@implementation GXHomeViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = GXImageMake(GXHome,@"home_home_tab");
        self.tabBarItem.selectedImage = GXImageMake(GXHome,@"home_home_tab_s");
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.automaticallyAdjustsScrollViewInsets = NO;
        [BBPhonePegasusDataParser updateDynamicData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - Public Method

#pragma mark - Event Response

#pragma mark - Private Method

#pragma mark - GXPageContainerChildVCDelegate

- (UIViewController *)pageContainer:(UIView *)pageContainer childVC:(UIViewController *)childVC forIndex:(NSInteger)index
{
    UIViewController *vc = (UIViewController *)childVC;
    if (!vc) {
        if (index == 0) {
            vc = self.liveVC;
        } else if (index == 1) {
            vc = self.recommendVC;
        } else if (index == 2) {
            vc = self.bangumiVC;
        } else {
            vc = [[UIViewController alloc] init];
        }
    }
    return vc;
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.view addSubview:self.pageContainerView];
}

- (GXPageContainerView *)pageContainerView
{
    if (_pageContainerView == nil) {
        GXContainerTopBarStyle *style = [[GXContainerTopBarStyle alloc] init];
        style.titles = @[@"直播",@"推荐",@"番剧"];
        CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49);
        _pageContainerView = [[GXPageContainerView alloc] initWithFrame:rect topBarStyle:style parentVC:self];
        _pageContainerView.childVCDelegate = self;
    }
    return _pageContainerView;
}

//- (GXHomeRecommendVC *)recommendVC
//{
//    if (_recommendVC == nil) {
//        _recommendVC = [[GXHomeRecommendVC alloc] init];
//    }
//    return _recommendVC;
//}
- (GXHomeRecommendVCV2 *)recommendVC {
    if (_recommendVC == nil) {
        _recommendVC = [[GXHomeRecommendVCV2 alloc] init];
    }
    return _recommendVC;
}

- (GXHomeLiveVC *)liveVC
{
    if (_liveVC == nil) {
        _liveVC = [[GXHomeLiveVC alloc] init];
    }
    return _liveVC;
}

- (GXHomeBangumiVC *)bangumiVC
{
    if (_bangumiVC == nil) {
        _bangumiVC = [[GXHomeBangumiVC alloc] init];
    }
    return _bangumiVC;
}

@end
