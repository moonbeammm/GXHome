//
//  GXHomeRecommendVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVC.h"
#import "GXHomeRecGameCell.h"
#import "GXHomeRecommendVM.h"
#import "GXHomeRecSpecialCell.h"
#import "GXLabel.h"
#import "GXImageView.h"

@interface GXHomeRecommendVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GXHomeRecommendVM *viewModel;
@property (nonatomic, strong) NSArray *cellClassArr;

@end

@implementation GXHomeRecommendVC
@synthesize viewModel;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewModel = [[GXHomeRecommendVM alloc] init];
        [self.viewModel loadData];
        self.cellClassArr = @[@"GXHomeRecGameCell"];
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

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.viewModel.objects.count) {
        return nil;
    }
    NSDictionary *dict = self.viewModel.objects[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dict[@"className"] forIndexPath:indexPath];
    for (UIView *subView in cell.contentView.subviews) {
        NSString *content = [subView valueForKey:@"content"];
        if (content.length > 0) {
            if ([subView isKindOfClass:[GXLabel class]]) {
                GXLabel * subLabel = (GXLabel *)subView;
                [subLabel setContentWithModel:dict[content]];
            } else if ([subView isKindOfClass:[GXImageView class]]) {
                GXImageView *subImageView = (GXImageView *)subView;
                [subImageView setContentWithModel:dict[content]];
            }
        }
    }
    return cell;
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
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.tableView];
    [self registerCell];
}

- (void)registerCell {
    [self.tableView registerClass:[GXHomeRecSpecialCell class] forCellReuseIdentifier:NSStringFromClass([GXHomeRecSpecialCell class])];
    for (NSString *cellClass in self.cellClassArr) {
        [self.tableView registerNib:[self getNibWithClass:cellClass isLocal:YES] forCellReuseIdentifier:cellClass];
    }
}

- (UINib *)getNibWithClass:(NSString *)class isLocal:(BOOL)isLocal {
    if (isLocal) {
        // 本地的xib文件
        UINib *nib = [UINib nibWithNibName:class bundle:[NSBundle bundleForClass:[self class]]];
        return nib;
    } else {
        // 服务端下发的xib文件
        NSString *nibName = [NSString stringWithFormat:@"%@.nib",class];
        NSData *data = [NSData dataWithContentsOfFile:kLibraryDirectory(nibName)];
        UINib *server_nib = [UINib nibWithData:data bundle:[NSBundle bundleForClass:[self class]]];
        return server_nib;
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
