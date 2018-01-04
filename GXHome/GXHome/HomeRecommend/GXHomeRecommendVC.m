//
//  GXHomeRecommendVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVC.h"
#import "GXHomeRecAVCell.h"

@interface GXHomeRecommendVC ()

@end

@implementation GXHomeRecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GXHomeRecAVCell getHeigthWithModel:nil params:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GXHomeRecAVCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeRecAVCell class]) forIndexPath:indexPath];
    [cell installWithModel:nil params:nil];
    return cell;
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.tableView registerClass:[GXHomeRecAVCell class] forCellReuseIdentifier:[GXHomeRecAVCell description]];
}

@end
