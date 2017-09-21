//
//  GXHomeViewController.m
//  GXHome
//
//  Created by sunguangxin on 2017/8/14.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeViewController.h"
#import <GXRuler/GXImageManager.h>
#import "GXHomeRouter.h"
#import <GXPageView/GXPageView.h>

@interface GXHomeViewController () <GXPageContainerChildVCDelegate>

@property (nonatomic, strong) GXPageContainerView *pageContainerView;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation GXHomeViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = GXImageMake(GXHome,@"home_home_tab");
        self.tabBarItem.selectedImage = GXImageMake(GXHome,@"home_home_tab_s");
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Public Method

#pragma mark - Private Method

#pragma mark - Event Response

#pragma mark - GXPageContainerChildVCDelegate

- (UIViewController *)pageContainer:(UIView *)pageContainer childVC:(UIViewController *)childVC forIndex:(NSInteger)index
{
    UIViewController *vc = (UIViewController *)childVC;
    if (!vc) {
        vc = [[UIViewController alloc] init];
    }
    if (index%2==0) {
        vc.view.backgroundColor = [UIColor orangeColor];
    } else {
        vc.view.backgroundColor = [UIColor blueColor];
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
        style.topBarBGColor = GX_PINK_COLOR;
        style.norTitleColor = [UIColor whiteColor];
        style.selTitleColor = [UIColor whiteColor];
        style.isHaveGradual = NO;
        style.titleMargin = 18;
        style.topPadding = 20;
        style.leftPadding = 30;
        style.defaultSelIndex = 1;
        style.indicatorBottomPadding = 3;
        style.indicatorColor = [UIColor whiteColor];
        CGRect rect = CGRectMake(0, 0, self.view.viewWidth, self.view.viewHeight);
        _pageContainerView = [[GXPageContainerView alloc] initWithFrame:rect topBarStyle:style parentVC:self];
        _pageContainerView.childVCDelegate = self;
    }
    return _pageContainerView;
}

@end
