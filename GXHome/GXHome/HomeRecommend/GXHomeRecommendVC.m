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

@interface GXHomeRecommendVC ()

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [GXHomeRecAVCell getHeigthWithModel:nil params:nil];
    } else {
        return [GXHomeRecGameCell getHeigthWithModel:nil params:nil];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GXHomeRecAVCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeRecAVCell class]) forIndexPath:indexPath];
        [cell installWithModel:nil params:nil];
        return cell;
    } else {
        GXHomeRecGameCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeRecGameCell class]) forIndexPath:indexPath];
        [cell installWithModel:nil params:nil];
        return cell;
    }
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.tableView registerClass:[GXHomeRecAVCell class] forCellReuseIdentifier:NSStringFromClass([GXHomeRecAVCell class])];
    
    // 本地的xib文件
    UINib *nib = [UINib nibWithNibName:@"GXHomeRecGameCell" bundle:[NSBundle bundleWithIdentifier:@"com.sgx.GXHome"]];
    
    // 服务端下发的xib文件
    NSData *data = [NSData dataWithContentsOfFile:kLibraryDirectory(@"GXHomeRecGameCell.nib")];
    UINib *server_nib = [UINib nibWithData:data bundle:[NSBundle bundleWithIdentifier:@"com.sgx.GXHome"]];
    // 如果服务下发了就用服务端的.没有就容错用本地的.
    if (server_nib) {
        [self.tableView registerNib:server_nib forCellReuseIdentifier:@"GXHomeRecGameCell"];
    } else {
        [self.tableView registerNib:nib forCellReuseIdentifier:@"GXHomeRecGameCell"];
    }
}

@end
