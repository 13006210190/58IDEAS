//
//  SelfZoneViewController.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "SelfZoneViewController.h"
#import "LoginViewController.h"
#import "RegistViewController.h"
#import "SelfZoneTableHeaderView.h"


#import "SelfZoneTableViewCell.h"
@interface SelfZoneViewController ()
@property (nonatomic, strong)SelfZoneTableHeaderView  *headerView;

@end

@implementation SelfZoneViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad {
    _tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    self.tableView.backgroundColor = HEX_COLOR(0xe6e6e6);
    UIView *baseHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width , 130)];
    self.headerView = [[[NSBundle mainBundle]loadNibNamed:@"SelfZoneTableHeaderView" owner:nil options:nil] firstObject];
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 130);
    [baseHeaderView addSubview:self.headerView];
    self.tableView.tableHeaderView = baseHeaderView;
}

- (SelfZoneTableHeaderView *)headerView {
    if (!_headerView) {
        SelfZoneTableHeaderView *view = [[SelfZoneTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140)];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        _headerView =view;
    }
    return _headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelfZoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelfZoneTableViewCell"];
    if (!cell) {
        cell = [[SelfZoneTableViewCell alloc]initWithStyle:1 reuseIdentifier:@"SelfZoneTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
        [self configCell:cell indexPath:indexPath];
        return cell;

}

- (void)configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
    cell.textLabel.text = [self titleWithIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[self imagenameWithIndexPath:indexPath]];
}

- (NSString *)imagenameWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return @"caifu";
        } else if (indexPath.row == 1) {
            return @"jihuoquan";
        } else if (indexPath.row == 2) {
            return @"youhuiquan";
        } else {
            return @"huiyuanka";
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return @"chengweihuiyuan";
        } else if (indexPath.row == 1) {
            return @"woyaoqingderen";
        } else {
            return @"chengweidaili";
        }
    } else {
        return indexPath.row ? @"guanyumaila":@"kefuzhongxin";
    }
}

- (NSString *)titleWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return @"我的财富";
        } else if (indexPath.row == 1) {
            return @"激活券";
        } else if (indexPath.row == 2) {
            return @"优惠券";
        } else {
            return @"会员卡";
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return @"成为会员";
        } else if (indexPath.row == 1) {
            return @"我邀请的人";
        } else {
            return @"成为代理";
        }
    } else {
        return indexPath.row ? @"关于买啦":@"客服中心";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .1f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 4 : section==1 ? 3:2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (void)showViewController:(UIViewController *)vc {
    [self presentViewController:vc animated:YES completion:nil];
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
