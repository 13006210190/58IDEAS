//
//  UIViewController+Category.m
//  MCKit
//
//  Created by Luffy on 16/5/11.
//  Copyright © 2016年 58. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/message.h>


@implementation UIViewController (Category)



- (UIBarButtonItem *)barButtonItem:(SEL)action title:(NSString *)title color:(UIColor *)color {
    return [[UIBarButtonItem alloc]initWithCustomView:[self navigationButton:action title:title color:color image:nil]];
}

- (UIBarButtonItem *)barButtonItem:(SEL)action image:(NSString *)imageName {
    return [[UIBarButtonItem alloc]initWithCustomView:[self navigationButton:action title:nil color:nil image:imageName]];
}

- (UIButton *)navigationButton:(SEL)action title:(NSString *)title color:(UIColor *)color image:(NSString *)imageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIFont *font = [UIFont systemFontOfSize:16];
    if (title) {
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:font}];
        [button.titleLabel setFont:font];
        [button setFrame:CGRectMake(0, 0, size.width + 10, MAX(30, size.height))];
    }   else {
        CGSize size = [UIImage imageNamed:imageName].size;
        [button.imageView setContentMode:UIViewContentModeCenter];
        [button setFrame:CGRectMake(0, 0, size.width + 10, MAX(30, size.height))];
    }
    
    [button setTitleColor:color forState:UIControlStateNormal];
    
    return button;
}

@end
