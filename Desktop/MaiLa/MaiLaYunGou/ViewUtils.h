//
//  ViewUtils.h
//  Craftsman
//
//  Created by Luffy on 17/1/11.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewUtils : NSObject
+ (UIButton *)buttonWithTarget:(id)target action:(SEL)selector title:(NSString *)title titleColor:(UIColor *)titleColor backColor:(UIColor *)backColor;
@end
