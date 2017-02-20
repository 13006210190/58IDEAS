//
//  NSString+Extensions.h
//  PetsApp
//
//  Created by maomao on 15/7/16.
//  Copyright (c) 2015年 miaoning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+Extensions.h"

#define UnNil(str) str == nil?@"":str
#define MCSTR(...) [NSString stringWithFormat:__VA_ARGS__]


@interface NSString (Extensions)
@property (nonatomic, readonly) BOOL isValidate;
@property (nonatomic, readonly) NSString *toMD5;
@property (nonatomic, readonly) id jsonObject;
@property (nonatomic, readonly) BOOL isEmail;
@property (nonatomic, readonly) BOOL isPhoneNumber;
@property (nonatomic, readonly) BOOL isPureInt;

+ (BOOL)validateMobile:(NSString *)mobile;
+ (NSString *)deflatedString:(NSString *)path;

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

@end
