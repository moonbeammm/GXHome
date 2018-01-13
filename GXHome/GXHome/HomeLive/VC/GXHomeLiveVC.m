//
//  GXHomeLiveVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeLiveVC.h"
#import "GXHomeLiveCell.h"
#import "GXHomeLiveVM.h"
#import "GXHomeLiveModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface GXHomeLiveVC ()
@property (nonatomic, strong) GXHomeLiveVM *viewModel;
@end

@implementation GXHomeLiveVC
@synthesize viewModel;
- (instancetype)init {
    if (self = [super init]) {
        self.viewModel = [[GXHomeLiveVM alloc] init];
        [self.viewModel loadData];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
    @weakify(self);
    [RACObserve(self.viewModel, objects) subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
        
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GXHomeLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeLiveCell class]) forIndexPath:indexPath];
    GXHomeLiveModel *data = nil;
    if (self.viewModel.objects.count > indexPath.row) {
        data = self.viewModel.objects[indexPath.row];
    }
    [cell installWithModel:data params:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.viewModel.objects.count) {
        return [GXHomeLiveCell getHeigthWithModel:nil params:nil];
    } else {
        return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GXHomeLiveModel *model = nil;
    if (self.viewModel.objects.count > indexPath.row) {
        model = self.viewModel.objects[indexPath.row];
    }
    [[GXHomeNavigator shared] showPlayerDetailVCWithUrl:model.playurl];
}

#pragma mark - Public Method

#pragma mark - Event Response

#pragma mark - Private Method

#pragma mark - Initialize Method

- (void)configSubviews {
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[GXHomeLiveCell class] forCellReuseIdentifier:NSStringFromClass([GXHomeLiveCell class])];

    self.tableView.frame = self.view.bounds;
}

@end
