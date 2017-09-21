//
//  GXHomeBangumiVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeBangumiVC.h"
#import <GXRuler/GXBaseTableViewCell.h>

@interface GXHomeBangumiVC ()

@end

@implementation GXHomeBangumiVC

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
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GXBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXBaseTableViewCell class]) forIndexPath:indexPath];
    NSString *title = @"我是番剧页!!";
    cell.textLabel.text = title;
    return cell;
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.tableView registerClass:[GXBaseTableViewCell class] forCellReuseIdentifier:[GXBaseTableViewCell description]];
    
}

@end
