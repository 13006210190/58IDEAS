//
//  UIColor+UIColorExtension.m
//  MCKit
//
//  Created by Luffy on 16/3/17.
//  Copyright © 2016年 58. All rights reserved.
//

#import "UIColor+UIColorExtension.h"

CGFloat flashColor(int color) {
    return color / 255.0f;
}

@implementation UIColor (UIColorExtension)

+ (id)colorWithHEX:(uint)color{
    return [[self class] colorWithHEX:color alpha:1];
}

+ (id)colorWithHEX:(uint)color alpha:(CGFloat)alpha {
    float r = (color&0xFF0000) >> 16;
    float g = (color&0xFF00) >> 8;
    float b = (color&0xFF);
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
}

+ (UIColor *)randomColor{
    float r = (double)arc4random() / 0x100000000;
    float g = (double)arc4random() / 0x100000000;
    float b = (double)arc4random() / 0x100000000;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+ (id)flashColorWithRed:(uint)red green:(uint)green blue:(uint)blue alpha:(float)alpha{
    float r = red/255.0f;
    float g = green/255.0f;
    float b = blue/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

+ (UIColor *)backGrayColor {
    return HEX_COLOR(0xf7f7f7);
}

+ (UIColor *)textBrownColor {
    return HEX_COLOR(0xc59b6b);
}

+ (UIColor *)textGrayColor {
    return HEX_COLOR(0xcccccc);
}

+ (UIColor *)textColor {
    return HEX_COLOR(0x333333);
}
+ (UIColor *)textRedColor {
    return HEX_COLOR(0xff5000);
}
+ (UIColor *)textDrakColor {
    return HEX_COLOR(0x333333);
}

@end
