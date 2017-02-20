//
//  UIColor+UIColorExtension.h
//  MCKit
//
//  Created by Luffy on 16/3/17.
//  Copyright © 2016年 58. All rights reserved.
//

#import <UIKit/UIKit.h>

CGFloat flashColor(int color);

#define HEX_COLOR(color) [UIColor colorWithHEX:color]
#define ADOBE_COLOR(r, g, b, a) [UIColor flashColorWithRed:r green:g blue:b alpha:a]

@interface UIColor (UIColorExtension)

+ (id)colorWithHEX:(uint)color;
+ (id)colorWithHEX:(uint)color alpha:(CGFloat)alpha;
+ (id)flashColorWithRed:(uint)red green:(uint)green blue:(uint)blue alpha:(float)alpha;
+ (UIColor *)randomColor;


+ (UIColor *)backGrayColor;
+ (UIColor *)textBrownColor;
+ (UIColor *)textGrayColor;
+ (UIColor *)textColor;
+ (UIColor *)textDrakColor;
+ (UIColor *)textRedColor;

@end
