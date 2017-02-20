//
//  LoginContentView.h
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfirmCodeButton.h"

@protocol  LoginFastViewDelegate <NSObject>

- (void)fastViewSendCode:(ConfirmCodeButton *)button phone:(NSString *)phone;
- (void)loginWithAccount:(NSString *)account code:(NSString *)code type:(NSInteger)fast;
@end

@interface LoginAccoutView : UIView<UITextFieldDelegate>
@property (weak, nonatomic)id<LoginFastViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *secretButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *questionButton;

@property (nonatomic ,copy)void(^loginBlock)();
@end



@interface LoginFastView : UIView<UITextFieldDelegate>
@property (weak, nonatomic)id<LoginFastViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet ConfirmCodeButton *codeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic ,copy)void(^loginBlock)();
@property (nonatomic ,copy)void(^sendCodeBlock)(ConfirmCodeButton *);
@end


@interface LoginContentView : UIView

@property (weak, nonatomic)id<LoginFastViewDelegate>delegate;

@property (nonatomic, strong)LoginAccoutView *accountView;
@property (nonatomic, strong)LoginFastView *fastView;

@property (nonatomic, strong)UIButton *fastLoginButton;
@property (nonatomic, strong)UIButton *normalLoginButton;
@property (nonatomic, strong)UIView *lineView;

@end
