//
//  GXHomeViewController.m
//  GXHome
//
//  Created by sunguangxin on 2017/8/14.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeViewController.h"
#import <GXRuler/GXImageManager.h>
#import <GXRuler/UIView+Frame.h>
#import "GXHomeRouter.h"

@interface GXHomeViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation GXHomeViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = GXImageMake(GXHome,@"home_home_tab");
        self.tabBarItem.selectedImage = GXImageMake(GXHome,@"home_home_tab_s");
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"首页";
        titleLabel.textColor = [UIColor blackColor];
        [self.navigationItem setTitleView:titleLabel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.btn];
    self.btn.frame = CGRectMake(0, 200, self.view.viewWidth, 100);
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"我是GXHome库的HomeVC.我跨库拉!" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _btn;
}

- (void)btnClick
{
    [GXHomeRouter pushUrl:@"main/business/protectvc" animated:YES];
}


@end
