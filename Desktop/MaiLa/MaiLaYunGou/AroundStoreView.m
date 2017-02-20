//
//  AroundStoreView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/13.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "AroundStoreView.h"

@implementation AroundStoreView

+ (id)instance {
    return [[[NSBundle mainBundle]loadNibNamed:@"AroundStoreView" owner:self options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
