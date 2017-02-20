//
//  NSString+Extensions.m
//  PetsApp
//
//  Created by maomao on 15/7/16.
//  Copyright (c) 2015年 miaoning. All rights reserved.
//

#import "NSString+Extensions.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (Extensions)
@dynamic toMD5,isPhoneNumber,isEmail,isValidate,isPureInt;

- (BOOL)isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isValidate {
    return self.length > 0;
}


+ (BOOL)validateMobile:(NSString *)mobile
{
    //        //手机号以13， 15，18开头，八个 \d 数字字符
    //       NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[^7,\\D])|(18[0,0-9]))\\d{8}$";
    //       NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //       return [phoneTest evaluateWithObject:mobile];
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,153,157,158,159,181,182,187,188,147
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189，177
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[02345-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,153,157,158,159,182,181，187,188,183
     12         */
    NSString * CM = @"^1(34[0-8]|4[57][0-8]|(3[5-9]|5[0137-9]|8[1278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|7[7]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|7[0678]|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES)
        || ([regextestcm evaluateWithObject:mobile] == YES)
        || ([regextestct evaluateWithObject:mobile] == YES)
        || ([regextestcu evaluateWithObject:mobile] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    
    
    //    if (mobile==nil||mobile.length !=11) {
    //        return NO;
    //    } else {
    //
    //        return YES;   }
    //
}

- (NSString *)toMD5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (id)jsonObject {
    NSString *str = [self stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];

    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:0
                                                  error:&error];
    return result;
}

- (BOOL)isPhoneNumber {
    NSString *phoneReg = @"^1\\d{10}$";
    return [self validateWithReg:phoneReg];
}

- (BOOL)isEmail {
    NSString *emailReg = @"^\\w*@\\w*.[\\w\\d.]*$";
    return [self validateWithReg:emailReg];
}

- (BOOL)validateWithReg:(NSString *)regular {
    return [[[NSRegularExpression alloc] initWithPattern:regular options:0 error:nil] firstMatchInString:self options:0 range:NSMakeRange(0, self.length)] != nil;
}

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

@end
