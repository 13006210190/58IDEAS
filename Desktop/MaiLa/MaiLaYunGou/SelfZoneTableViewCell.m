//
//  SelfZoneTableViewCell.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/10.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "SelfZoneTableViewCell.h"

@implementation SelfZoneTableViewCell

- (UILabel *)textLabel {
    if (!__textLabel) {
        __textLabel = [super textLabel];
        __textLabel.textColor = HEX_COLOR(0x454545);
        __textLabel.font = [UIFont systemFontOfSize:15.f];
    }
    return __textLabel;
}

+ (CGFloat)height {
    return 44;
}

@end
