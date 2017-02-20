//
//  AroundStoreCell.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/13.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "AroundStoreCell.h"

@implementation AroundStoreCell

+ (CGFloat)height {
    return 140;
}

- (AroundStoreView *)item1 {
    if (!_item1) {
        _item1 = [AroundStoreView instance];
        _item1.starview.star = 1.5;
        [self.contentView addSubview:_item1];
    }
    return _item1;
}

- (AroundStoreView *)item2 {
    if (!_item2) {
        _item2 = [AroundStoreView instance];
        _item1.starview.star = 3.5;
        [self.contentView addSubview:_item2];
    }
    return _item2;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.frame.size.width *.5f;
    self.item1.frame = CGRectMake(0, 0, width, self.frame.size.height);
    self.item2.frame = CGRectMake(width, 0, width, self.frame.size.height);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(rect.size.width*.5f, 0)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width*.5f, rect.size.height)];
    [HEX_COLOR(0xe6e6e6) setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
