//
//  GXHomeRecommendVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVC.h"
#import "GXHomeRecAVCell.h"
#import "GXHomeRecGameCell.h"
#import "GXHomeRecommendVM.h"
#import "GXHomeRecSpecialCell.h"

@interface GXHomeRecommendVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GXHomeRecommendVM *viewModel;

@end

@implementation GXHomeRecommendVC
@synthesize viewModel;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewModel = [[GXHomeRecommendVM alloc] init];
        [self.viewModel loadData];
    }
    return self;
}

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
//        GXHomeRecAVCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeRecAVCell class]) forIndexPath:indexPath];
//        [cell installWithModel:nil params:nil];
        GXHomeRecSpecialCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeRecSpecialCell class]) forIndexPath:indexPath];
        [cell installWithModel:nil params:nil];
        return cell;
    } else {
        GXHomeRecGameCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeRecGameCell class]) forIndexPath:indexPath];
        [cell installWithModel:nil params:nil];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 375;
    } else {
        return 400;
    }
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[GXHomeRecAVCell class] forCellReuseIdentifier:NSStringFromClass([GXHomeRecAVCell class])];
    
    UINib *specialNib = [UINib nibWithNibName:@"GXHomeRecSpecialCell" bundle:[NSBundle bundleWithIdentifier:@"com.sgx.GXHome"]];
    [self.tableView registerNib:specialNib forCellReuseIdentifier:@"GXHomeRecSpecialCell"];
    // 本地的xib文件
    UINib *nib = [UINib nibWithNibName:@"GXHomeRecGameCell" bundle:[NSBundle bundleWithIdentifier:@"com.sgx.GXHome"]];
    
    // 服务端下发的xib文件
    NSData *data = [NSData dataWithContentsOfFile:kLibraryDirectory(@"GXHomeRecGameCell.nib")];
    UINib *server_nib = [UINib nibWithData:data bundle:[NSBundle bundleWithIdentifier:@"com.sgx.GXHome"]];
    // 如果服务下发了就用服务端的.没有就容错用本地的.
    if (!server_nib) {
        [self.tableView registerNib:server_nib forCellReuseIdentifier:@"GXHomeRecGameCell"];
    } else {
        [self.tableView registerNib:nib forCellReuseIdentifier:@"GXHomeRecGameCell"];
    }
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = self.view.backgroundColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

@end
