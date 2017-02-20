//
//  HotGoodTableViewCell.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "HotGoodTableViewCell.h"

@implementation HotGoodTableViewCell

+ (CGFloat)height {
    return 120;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.starview.star = 3.5;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
