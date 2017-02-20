//
//  ViewUtils.m
//  Craftsman
//
//  Created by Luffy on 17/1/11.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils
+ (UIButton *)buttonWithTarget:(id)target action:(SEL)selector title:(NSString *)title titleColor:(UIColor *)titleColor backColor:(UIColor *)backColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backColor];
    return button;
}
@end
