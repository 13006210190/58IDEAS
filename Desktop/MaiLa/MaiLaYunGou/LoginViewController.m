//
//  LoginViewController.m
//  DingDang
//
//  Created by Luffy on 16/12/5.
//  Copyright © 2016年 Luffy. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginContentView.h"
#import "MCNavigationController.h"
#import "UIViewController+Category.h"
#import "RegistViewController.h"
#import "NSString+Extensions.h"
@interface LoginViewController ()<UITextFieldDelegate,LoginFastViewDelegate>
@property (nonatomic, strong)LoginContentView *contentView;
@end

@implementation LoginViewController

+ (UINavigationController *)loginViewController {
    return [[MCNavigationController alloc]initWithRootViewController:[LoginViewController new]];
}

- (LoginContentView *)contentView {
    if (!_contentView) {
        _contentView = [[LoginContentView alloc]initWithFrame:self.view.bounds];
        
        _contentView.delegate = self;
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.contentView.center = self.view.center;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (NSString *)title {
    return @"登录";
}

- (void)loginWithAccount:(NSString *)account code:(NSString *)code type:(NSInteger)fast {
    if (fast == 1) {
        if (!account.isPhoneNumber) {
            
        }
        if (!code.isValidate) {
            
            return;
        }
                [self dismissViewControllerAnimated:YES completion:nil];
        
        
    } else {
        if (!account.isPhoneNumber) {
            return;
        }
        if (!code.isValidate) {
            return;
        }
        
                [self dismissViewControllerAnimated:YES completion:nil];
         
    }
}


- (void)toRegister:(id)sender {
    [self.navigationController pushViewController:[RegistViewController new] animated:YES];
}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.contentView;
    self.navigationItem.leftBarButtonItem = [self barButtonItem:@selector(back) image:@"back.png"];
    self.navigationItem.rightBarButtonItem = [self barButtonItem:@selector(toRegister:) title:@"注册" color:[UIColor whiteColor]];
}

- (void)fastViewSendCode:(ConfirmCodeButton *)button phone:(NSString *)phone {
    NSString *error = nil;
    BOOL flag = [button checkPhone:phone error:&error];
    if (!flag) {
        
    } else {
        [self.view endEditing:YES];
        
        
        
    }
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
