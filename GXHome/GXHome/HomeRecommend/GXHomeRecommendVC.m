//
//  GXHomeRecommendVC.m
//  GXHome
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVC.h"
#import "GXHomeRecommendVM.h"

#import "BBPhonePegasusCell.h"
#import "BBPhonePegasusDataParser.h"

@interface GXHomeRecommendVC () <UITableViewDelegate, UITableViewDataSource, BBPhonePegasusDynamicProtocol>

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
        self.cellClassArr = [BBPhonePegasusDataParser getSupportCellTypes:BBPhoneLayoutTypeSingle];
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

- (void)pegasusCell:(UITableViewCell *)cell clickView:(UIView *)view eventID:(NSString *)eventID {
    NSLog(@"点击cell里的某个控件");
}

- (void)pegasusCell:(UITableViewCell *)cell clickMoreActionView:(UIView *)view {
    NSLog(@"点击三点按钮");
}

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.viewModel.objects.count) {
        return [UITableViewCell new];
    }
    NSDictionary *dict = self.viewModel.objects[indexPath.row];
    NSString *layoutType = [BBPhonePegasusDataParser transformLayoutType:dict[@"layout_type"] type:BBPhoneLayoutTypeSingle];
    if (![_cellClassArr containsObject:layoutType]) {
        return [UITableViewCell new];
    }
    BBPhonePegasusCell *cell = [tableView dequeueReusableCellWithIdentifier:layoutType forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(installCellWithDict:)]) {
        [cell installCellWithDict:dict];
        if (!cell.delegate) {
            cell.delegate = self;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"sunguangxin: didSelectRowAtIndexPath");
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

#pragma mark - Initialize Method

- (void)configSubviews {
    [self.view addSubview:self.tableView];
    [self registerCell];
}

- (void)registerCell {
    for (NSString *cellClass in self.cellClassArr) {
        [self.tableView registerNib:[BBPhonePegasusDataParser getNibWithClass:cellClass] forCellReuseIdentifier:cellClass];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = self.view.backgroundColor;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

@end
