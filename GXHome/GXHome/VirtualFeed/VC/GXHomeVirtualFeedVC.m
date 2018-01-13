//
//  GXHomeVirtualFeedVC.m
//  GXHome
//
//  Created by sgx on 2018/1/10.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeVirtualFeedVC.h"
#import "GXHomeVirtualFeedCell.h"

@interface GXHomeVirtualFeedVC ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation GXHomeVirtualFeedVC
@synthesize viewModel;

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"VirtualFeed";
        self.array = @[
                       @{@"gotoType":@"AV",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"duration":@"123123",
                         @"play":@"play",
                         @"danmaku":@"321312",
                         @"reply":@"reply",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
                       ];
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Public Method

#pragma mark - Event Response

#pragma mark - Private Method

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GXHomeVirtualFeedCell getHeigthWithModel:nil params:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GXHomeVirtualFeedCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXHomeVirtualFeedCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row < self.array.count) {
        [cell installWithModel:self.array[indexPath.row] params:nil];
    }
    return cell;
}

#pragma mark - Initialize Method

- (void)configSubviews
{
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[GXHomeVirtualFeedCell class] forCellReuseIdentifier:NSStringFromClass([GXHomeVirtualFeedCell class])];
}

@end
