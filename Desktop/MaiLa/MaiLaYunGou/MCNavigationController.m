//
//  MCNavigationController.m
//  MCKit
//
//  Created by Luffy on 16/7/15.
//  Copyright © 2016年 58. All rights reserved.
//

#import "MCNavigationController.h"
#import "UIColor+UIColorExtension.h"

@interface MCNavigationController ()<UINavigationControllerDelegate>

@end

@implementation MCNavigationController

+ (void)load {
    UIImage *backButtonImage = [[UIImage imageNamed:@"back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 23, 1, 1) resizingMode:UIImageResizingModeStretch];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont italicSystemFontOfSize:18]}];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10),YES,0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor textRedColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 10, 10));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (BOOL)shouldAutorotate {
    return NO;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
     return UIInterfaceOrientationMaskPortrait;
}

- (void)handleReturnButtonTaped:(id)sender {
    [self popViewControllerAnimated:YES];
}

@end
