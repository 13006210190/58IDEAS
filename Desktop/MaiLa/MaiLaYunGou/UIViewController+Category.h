//
//  UIViewController+Category.h
//  MCKit
//
//  Created by Luffy on 16/5/11.
//  Copyright © 2016年 58. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)<UIGestureRecognizerDelegate>

- (UIBarButtonItem *)barButtonItem:(SEL)action image:(NSString *)imageName;
- (UIBarButtonItem *)barButtonItem:(SEL)action title:(NSString *)title color:(UIColor *)color;
@end
