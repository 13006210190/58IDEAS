//
//  SelfZoneTableHeaderView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/17.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "SelfZoneTableHeaderView.h"

@implementation SelfZoneTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"SelfZoneTableHeaderView" owner:self options:nil] firstObject];
        
    }
    return self;
}

+ (id)newinstance {
    return [[[NSBundle mainBundle]loadNibNamed:@"SelfZoneTableHeaderView" owner:self options:nil] lastObject];
}

@end
