//
//  GXHomeBangumiVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeBangumiVC.h"
#import "GXHomeBangumiCell.h"
#import "GXHomeBangumiModel.h"
#import "GXHomeBangumiViewModel.h"

@interface GXHomeBangumiVC ()

@property (nonatomic, strong) GXHomeBangumiViewModel *viewModel;

@end

@implementation GXHomeBangumiVC
@synthesize viewModel;

- (instancetype)init
{
    if (self = [super init]) {
        self.viewModel = [[GXHomeBangumiViewModel alloc] init];
        [self.viewModel loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configSubviews];
    @weakify(self);
    [RACObserve(self.viewModel, objects) subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
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
    return self.viewModel.objects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GXHomeBangumiCell getHeigthWithModel:nil params:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GXHomeBangumiCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeBangumiCell class]) forIndexPath:indexPath];
    if (indexPath.row < self.viewModel.objects.count) {
        GXHomeBangumiModel *data = self.viewModel.objects[indexPath.row];
        [cell installWithModel:data params:nil];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.tableView registerClass:[GXHomeBangumiCell class] forCellReuseIdentifier:[GXHomeBangumiCell description]];
}

@end
