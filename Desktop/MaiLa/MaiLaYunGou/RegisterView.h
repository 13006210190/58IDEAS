//
//  RegisterView.h
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/10.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfirmCodeButton.h"
@interface RegisterView : UIView

@end
@interface RegisterSuperView : UIView
+ (id)newInstance;
- (void)dismissAnimation;
- (void)showAnimation;
@end


@interface RegisterView1 : RegisterSuperView
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end


@interface RegisterView2 : RegisterSuperView
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet ConfirmCodeButton *codeButton;
@property (copy, nonatomic)void(^sendCodeBlock)();
@end


@interface RegisterView3 : RegisterSuperView
@property (weak, nonatomic) IBOutlet UIButton *roleButton1;
@property (weak, nonatomic) IBOutlet UIButton *roleButton2;
@property (weak, nonatomic) IBOutlet UIButton *roleButton3;
@property (nonatomic, strong)NSString *role;
@end


@interface RegisterView4 : RegisterSuperView
@property (weak, nonatomic) IBOutlet UITextField *password1;
@property (weak, nonatomic) IBOutlet UITextField *password2;

@end

