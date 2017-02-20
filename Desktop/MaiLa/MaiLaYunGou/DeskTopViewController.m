//
//  DeskTopViewController.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "DeskTopViewController.h"
#import "UIViewController+Category.h"
#import "DeskHeaderView.h"
#import "DeskClassCell.h"
#import "HotGoodTableViewCell.h"
#import "UIViewController+Login.h"
#import "LBXScanViewStyle.h"
#import "SubLBXScanViewController.h"
#import "AroundStoreCell.h"



@implementation DeskTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _icon = [UIImageView new];
    _icon.image = [UIImage imageNamed:@"fangdajing.png"];
    [_icon sizeToFit];
    [self addSubview:_icon];
    
    _label = [UILabel new];
    _label.textColor = [UIColor textGrayColor];
    _label.text = @"华为 Mate9";
    _label.font = Font(13);
    [_label sizeToFit];
    [self addSubview:_label];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = _icon.frame.size.width + _label.frame.size.width + 10.f;
    CGFloat x = (self.frame.size.width-width)*.5f;
    _icon.frame = CGRectMake(x, (self.frame.size.height-_icon.frame.size.height)*.5f, _icon.frame.size.width, _icon.frame.size.height);
    _label.frame = CGRectMake(x+_icon.frame.size.width+10, (self.frame.size.height-_label.frame.size.height)*.5f, _label.frame.size.width, _label.frame.size.height);
}

@end

@interface DeskTopViewController ()<UISearchBarDelegate>{
    UIBarButtonItem *_leftItem;
    DeskHeaderView *_headerView;
}

@end

@implementation DeskTopViewController

- (void)titleClick {
}

- (void)viewDidLoad {
    _tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    self.tableView.backgroundColor = HEX_COLOR(0xe6e6e6);
    DeskTitleView *titleView = [[DeskTitleView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 30)];
    titleView.image = [UIImage imageNamed:@"sousuokuang.png"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick)];
    titleView.userInteractionEnabled = YES;
    [titleView addGestureRecognizer:tap];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 40)];
    
    [searchBar setBackgroundImage:[UIImage imageNamed:@"sousuokuang.png"]];
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"sousuokuang.png"] forState:UIControlStateNormal];
    [searchBar setPlaceholder:@"按哦莫"];
    searchBar.delegate = self;
    self.navigationItem.titleView = titleView;
    self.navigationItem.rightBarButtonItems = @[[self barButtonItem:@selector(messageClick:) image:@"xinxi.png"],[self barButtonItem:@selector(saoyisao:) image:@"erweima.png"]];
    self.navigationItem.leftBarButtonItem = [self barButtonItem:@selector(dingweiClick:) title:@"南昌" color:[UIColor whiteColor]];
    
    DeskHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"DeskHeaderView" owner:self options:nil] lastObject];
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 217);
    headerView.dataArray = @[@1,@1,@2,@2,@2,@2,@2,@1,@2,@2,@2,@2,@2,@1,@2,@2,@2,@2,@2];
    [headerView setClickItemBlock:^(NSInteger index) {
         [self presentViewController:[LoginViewController loginViewController] animated:YES completion:nil];
    }];
    _headerView = headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ?10.f: 217;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return section ? [UIView new] : _headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .01f;
}

- (void)saoyisao:(id)sender {

    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    vc.title = @"扫一扫";
    vc.style = style;
    vc.isQQSimulator = YES;
    vc.isVideoZoom = YES;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)messageClick:(id)sender {
}

- (void)dingweiClick:(id)sender {
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section) {
        HotGoodTableViewCell *cell = [HotGoodTableViewCell cellForTable:tableView];
        return cell;
    } else {
        if (indexPath.row == 0) {
            return [DeskClassCell cellForTable:tableView];
        } else {
            AroundStoreCell *cell = [AroundStoreCell cellForTable:tableView];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section) {
        return [HotGoodTableViewCell height];
    } else {
    return indexPath.row ? [AroundStoreCell height] : [DeskClassCell height];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section ? 20 : 3;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
