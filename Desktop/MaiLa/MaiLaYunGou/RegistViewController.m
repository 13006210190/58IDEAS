//
//  RegistViewController.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/10.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistStepView.h"
#import "RegistBottomView.h"
#import "ConfirmCodeButton.h"
#import "RegisterView.h"
#import "NSString+Extensions.h"

@interface RegistViewController ()<RegistBottomViewDelegate> {
    
    
}
@property (nonatomic, strong)NSString *phone;
@property (nonatomic, strong)NSString *code;
@property (nonatomic, strong)NSString *role;
@property (nonatomic, strong)NSString *password;

@property (nonatomic, strong)RegistStepView *stepView;
@property (nonatomic, strong)RegistBottomView *bottomView;
@property (nonatomic, strong)RegisterView1 *registerView1;
@property (nonatomic, strong)RegisterView2 *registerView2;
@property (nonatomic, strong)RegisterView3 *registerView3;
@property (nonatomic, strong)RegisterView4 *registerView4;
@end

@implementation RegistViewController

- (NSString *)title {
    return @"注册";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _stepView = [RegistStepView newInstance];
    _stepView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _stepView.frame = CGRectMake(0, 10, self.view.frame.size.width, 44);
    [self.view addSubview:_stepView];
    [self setUpStep];
    
    _registerView1 = [RegisterView1 newInstance];
    _registerView1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _registerView1.frame = CGRectMake(0, 20+44 , self.view.frame.size.width, 45);
    [self.view addSubview:_registerView1];
    
    _bottomView = [RegistBottomView newInstance];
    _bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _bottomView.frame = CGRectMake(0, 64 + 45, self.view.frame.size.width, 100);
    _bottomView.delegate = self;
    [self.view addSubview:_bottomView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEX_COLOR(0xcccccc);
    _step = 1;
    
}

- (void)bottomViewClick:(UIButton *)button {
    [self.view endEditing:YES];
    if (_step == 1) {
        if ([_registerView1.textField.text isPhoneNumber]) {
            _phone = _registerView1.textField.text;
            
        } else {
            
        }
    } else if (_step == 2) {
        if ([self.registerView2.codeTF.text isEqualToString:_code]) {
            [self animation];
        } else {
            
        }
    } else if (_step == 3) {
        if (self.registerView3.role.isValidate) {
            self.role = self.registerView3.role;
            [self animation];
        } else {
            
        }
    } else if (_step == 4) {
        if (self.registerView4.password1.text.length >= 6 && [self.registerView4.password1.text isEqualToString:self.registerView4.password2.text]) {
            self.password = self.registerView4.password1.text;
            [self registerAccount];
        } else {
            
        }
    }
}

- (void)registerAccount {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (RegisterView2 *)registerView2 {
    if (!_registerView2) {
        _registerView2 = [RegisterView2 newInstance];
        _registerView2.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        _registerView2.alpha = .5f;
        _registerView2.frame = CGRectMake(self.view.frame.size.width, 64, self.view.frame.size.width, 45);
        [self.view addSubview:_registerView2];
        __weak typeof (self)weakSelf = self;
        [_registerView2 setSendCodeBlock:^{
            
        }];
    }
    return _registerView2;
}

- (RegisterView3 *)registerView3 {
    if (!_registerView3) {
        _registerView3 = [RegisterView3 newInstance];
        _registerView3.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        _registerView3.alpha = .5f;
        _registerView3.frame = CGRectMake(self.view.frame.size.width, 64, self.view.frame.size.width, 120);
        [self.view addSubview:_registerView3];
    }
    return _registerView3;
}

- (RegisterView4 *)registerView4 {
    if (!_registerView4) {
        _registerView4 = [RegisterView4 newInstance];
        _registerView4.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        _registerView4.alpha = .5f;
        _registerView4.frame = CGRectMake(self.view.frame.size.width, 64, self.view.frame.size.width, 90);
        [self.view addSubview:_registerView4];
    }
    return _registerView4;
}

- (void)animation {
    if (_step == 1) {
        [UIView animateWithDuration:.25f animations:^{
            [_registerView1 dismissAnimation];
        } completion:^(BOOL finished) {
            _registerView1.alpha = 1;
            [self.registerView2 showAnimation];
            [self.bottomView.button setTitle:@"下一步" forState:UIControlStateNormal];
            [self.registerView2.codeButton resetRemainTime];
            _step = 2;
            [self setUpStep];
        }];
    } else if (_step == 2) {
        [UIView animateWithDuration:.25f animations:^{
            [self.registerView2 dismissAnimation];
            CGRect rect = self.bottomView.frame;
            rect.origin.y = 64+120;
            self.bottomView.frame = rect;
        } completion:^(BOOL finished) {
            [_registerView2 removeFromSuperview];
            _registerView2 = nil;
            [self.registerView3 showAnimation];
            [self.bottomView.button setTitle:@"下一步" forState:UIControlStateNormal];
            _step = 3;
            [self setUpStep];
        }];
    } else if (_step == 3) {
        [UIView animateWithDuration:.25f animations:^{
            [self.registerView3 dismissAnimation];
            CGRect rect = self.bottomView.frame;
            rect.origin.y = 64+90;
            self.bottomView.frame = rect;
        } completion:^(BOOL finished) {
            [_registerView3 removeFromSuperview];
            _registerView3 = nil;
            [self.registerView4 showAnimation];
            [self.bottomView.button setTitle:@"注册" forState:UIControlStateNormal];
            _step = 4;
            [self setUpStep];
        }];
    }
}

- (void)setUpStep {
    if (_step == 1) {
        _stepView.label1.textColor = [UIColor textRedColor];
    } else if (_step == 2) {
        _stepView.label2.textColor = [UIColor textRedColor];
    } else if (_step == 3) {
        _stepView.label3.textColor = [UIColor textRedColor];
    }else {
        _stepView.label4.textColor = [UIColor textRedColor];
    }
}

- (void)reset {
    _stepView.label2.textColor = [UIColor textColor];
    _stepView.label3.textColor = [UIColor textColor];
    _stepView.label4.textColor = [UIColor textColor];
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

