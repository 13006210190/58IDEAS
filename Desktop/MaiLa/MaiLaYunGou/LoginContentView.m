//
//  LoginContentView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "LoginContentView.h"
#import "UIColor+UIColorExtension.h"
#import "ViewUtils.h"

@implementation LoginAccoutView

+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"LoginAccoutView" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.accountTF.keyboardType = UIKeyboardTypeNumberPad;
    self.passwordTF.keyboardType = UIKeyboardTypeASCIICapable;
    self.passwordTF.secureTextEntry = YES;
    self.loginButton.layer.cornerRadius = 4.f;
    self.loginButton.layer.masksToBounds = YES;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(accountTextFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:self.accountTF];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:self.passwordTF];
}

- (void)setButtonBack:(BOOL)hightLighted {
    if (hightLighted) {
        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"zhuce2.png"] forState:UIControlStateNormal];
    } else {
        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"zhuce.png"] forState:UIControlStateNormal];
    }
}

-(void)accountTextFieldTextDidChange:(NSNotification *)notification
{
    UITextField *textfield=[notification object];
    if (textfield.text.length > 0 && self.passwordTF.text.length >0) {
        [self setButtonBack:YES];
    } else {
        [self setButtonBack:NO];
    }
}
-(void)textFieldTextDidChange:(NSNotification *)notification
{
    UITextField *textfield=[notification object];
    if (textfield.text.length > 0 && self.accountTF.text.length >0) {
        [self setButtonBack:YES];
    } else {
        [self setButtonBack:NO];
    }
}

- (IBAction)secretClick:(UIButton *)sender {
    self.passwordTF.secureTextEntry = !self.passwordTF.isSecureTextEntry;
    [sender setImage:[UIImage imageNamed:self.passwordTF.isSecureTextEntry ? @"biyan":@"zhengyan"] forState:UIControlStateNormal];
}

- (IBAction)loginClick:(id)sender {
    [self endEditing:YES];
    [self.delegate loginWithAccount:self.accountTF.text code:self.passwordTF.text type:0];
}

- (IBAction)questionClick:(id)sender {
}

@end

@implementation LoginFastView
+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"LoginFastView" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    self.codeTF.keyboardType = UIKeyboardTypeNumberPad;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(accountTextFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:self.phoneTF];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:self.codeTF];
}
- (void)setButtonBack:(BOOL)hightLighted {
    if (hightLighted) {
        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"zhuce2.png"] forState:UIControlStateNormal];
    } else {
        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"zhuce.png"] forState:UIControlStateNormal];
    }
}

-(void)accountTextFieldTextDidChange:(NSNotification *)notification
{
    UITextField *textfield=[notification object];
    if (textfield.text.length > 0 && self.codeTF.text.length >0) {
        [self setButtonBack:YES];
    } else {
        [self setButtonBack:NO];
    }
}
-(void)textFieldTextDidChange:(NSNotification *)notification
{
    UITextField *textfield=[notification object];
    if (textfield.text.length > 0 && self.phoneTF.text.length >0) {
        [self setButtonBack:YES];
    } else {
        [self setButtonBack:NO];
    }
}
- (IBAction)sendCode:(id)sender {
    [self endEditing:YES];
    [self.delegate fastViewSendCode:sender phone:self.phoneTF.text];
    
}

- (IBAction)loginClick:(id)sender {
    [self.delegate loginWithAccount:self.phoneTF.text code:self.codeTF.text type:1];
}

@end

@implementation LoginContentView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    return self;
}
- (LoginAccoutView *)accountView {
    if (!_accountView) {
        _accountView = [LoginAccoutView newInstance];
        [self addSubview:_accountView];
        _accountView.delegate = self.delegate;
    }return _accountView;
}

- (LoginFastView *)fastView {
    if (!_fastView) {
        _fastView = [LoginFastView newInstance];
        [self addSubview:_fastView];
        _fastView.hidden = YES;
        _fastView.delegate = self.delegate;
    }return _fastView;
}

- (UIButton *)fastLoginButton {
    if (!_fastLoginButton) {
        _fastLoginButton = [ViewUtils buttonWithTarget:self action:@selector(buttonClick:)  title:@"手机号快捷登录" titleColor:[UIColor textColor] backColor:[UIColor clearColor]];
        [self addSubview:_fastLoginButton];
    }
    return _fastLoginButton;
}

- (UIButton *)normalLoginButton {
    if (!_normalLoginButton) {
        _normalLoginButton = [ViewUtils buttonWithTarget:self action:@selector(buttonClick:)  title:@"账号密码登录" titleColor:[UIColor textRedColor] backColor:[UIColor clearColor]];
        [self addSubview:_normalLoginButton];
    }
    return _normalLoginButton;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 41, self.frame.size.width/2, 3)];
        _lineView.backgroundColor = [UIColor textRedColor];
        [self addSubview:_lineView];
    }
    return _lineView;
}

- (void)buttonClick:(UIButton *)button {
    
    [UIView animateWithDuration:.25f animations:^{
        CGRect rect = self.lineView.frame;
        rect.origin.x = button.frame.origin.x;
        rect.size.width = button.frame.size.width;
        self.lineView.frame = rect;
    }];
    [button setTitleColor:[UIColor textRedColor] forState:UIControlStateNormal];
    if (button == self.normalLoginButton) {
        [self.fastLoginButton setTitleColor:[UIColor textColor] forState:UIControlStateNormal];
        self.accountView.hidden = NO;
        self.fastView.hidden = YES;
    } else {
        self.accountView.hidden = YES;
        self.fastView.hidden = NO;
        [self.normalLoginButton setTitleColor:[UIColor textColor] forState:UIControlStateNormal];
    }
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat buttonWidth = self.frame.size.width *.5f;
    CGFloat buttonHeight = 44.f;
    self.normalLoginButton.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
    self.fastLoginButton.frame = CGRectMake(buttonWidth, 0, buttonWidth, buttonHeight);
    [self.lineView class];
    
    self.accountView.frame = CGRectMake(0, 44, self.frame.size.width, self.frame.size.height-44);
    self.fastView.frame = CGRectMake(0, 44, self.frame.size.width, self.frame.size.height-44);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(0, 43)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width, 43)];
    [HEX_COLOR(0xcccccc) setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
}

@end
