//
//  MainTabBarViewController.m
//  Craftsman
//
//  Created by Luffy on 16/12/13.
//  Copyright © 2016年 Luffy. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MCNavigationController.h"
#import "DeskTopViewController.h"
#import "NearByViewController.h"
#import "MyOrderViewController.h"
#import "SelfZoneViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    [self reloadContentView];
}

- (void)reloadContentView {
    UIColor *selectColor = HEX_COLOR(0xc59b6c);
    DeskTopViewController *deskController = [DeskTopViewController new];
    deskController.title = @"首页";
    UINavigationController *deskNV = [[MCNavigationController alloc]initWithRootViewController:deskController];
    deskController.tabBarItem.image = [[UIImage imageNamed:@"shouye1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    deskController.tabBarItem.selectedImage = [[UIImage imageNamed:@"shouye2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [deskController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                       dictionaryWithObjectsAndKeys: selectColor,
                                                       NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [deskController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                       dictionaryWithObjectsAndKeys: [UIColor textColor],
                                                       NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    NearByViewController *pmController = [NearByViewController new];
    pmController.title = @"附近";
    UINavigationController *pmNV = [[MCNavigationController alloc]initWithRootViewController:pmController];
    pmController.tabBarItem.image = [[UIImage imageNamed:@"fujin1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    pmController.tabBarItem.selectedImage = [[UIImage imageNamed:@"fujin2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [pmController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                            dictionaryWithObjectsAndKeys: selectColor,
                                                            NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [pmController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                            dictionaryWithObjectsAndKeys: [UIColor textColor],
                                                            NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    MyOrderViewController *labourController = [MyOrderViewController new];
    labourController.title = @"订单";
    UINavigationController *labourNV = [[MCNavigationController alloc]initWithRootViewController:labourController];
    labourController.tabBarItem.image = [[UIImage imageNamed:@"dingdan1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    labourController.tabBarItem.selectedImage = [[UIImage imageNamed:@"dingdan2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [labourController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                     dictionaryWithObjectsAndKeys: selectColor,
                                                     NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [labourController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                     dictionaryWithObjectsAndKeys: [UIColor textColor],
                                                     NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    SelfZoneViewController *selfzoneController = [SelfZoneViewController new];
    UINavigationController *selfNV = [[MCNavigationController alloc]initWithRootViewController:selfzoneController];
    selfzoneController.title = @"我的";
    selfzoneController.tabBarItem.image = [[UIImage imageNamed:@"wode1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selfzoneController.tabBarItem.selectedImage = [[UIImage imageNamed:@"wode2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [selfzoneController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                           dictionaryWithObjectsAndKeys: selectColor,
                                                           NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [selfzoneController.tabBarItem setTitleTextAttributes:[NSDictionary
                                                           dictionaryWithObjectsAndKeys: [UIColor textColor],
                                                           NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.viewControllers = nil;
    self.viewControllers = @[deskNV,pmNV,labourNV,selfNV];
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
