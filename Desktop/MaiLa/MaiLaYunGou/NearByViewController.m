//
//  NearByViewController.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "NearByViewController.h"
#import "HotGoodTableViewCell.h"
#import "DeskTopViewController.h"
#import "UIViewController+Category.h"
#import "NearByCell.h"

@interface NearByListViewController : MCTableViewController

@end
@implementation NearByListViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        NearByCell *cell = [NearByCell cellForTable:tableView];
        return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}


@end

@interface NearByViewController ()

@end

@implementation NearByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DeskTitleView *titleView = [[DeskTitleView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    titleView.image = [UIImage imageNamed:@"sousuokuang.png"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick)];
    titleView.userInteractionEnabled = YES;
    [titleView addGestureRecognizer:tap];
    self.navigationItem.titleView = titleView;
    
    self.navigationItem.leftBarButtonItem = [self barButtonItem:@selector(dingweiClick:) title:@"南昌" color:[UIColor whiteColor]];
}

- (void)titleClick {

    }

- (void)dingweiClick:(id)sender {

}


- (NSArray *)navigationTitles {
    return @[@"享美食",@"住酒店",@"爱玩乐",@"全部"];
}

- (UIViewController *)initializeContentViewControllerForIndex:(NSInteger)index {
    NearByListViewController *controller = [NearByListViewController new];
    return controller;
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
