//
//  StarView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/13.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (void)setStar:(CGFloat)star {
    _star = star;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    NSString *imageName;
    NSInteger starInt = floor(self.star);
    CGFloat hasHalfStar = NO;
    if (self.star > starInt) {
        hasHalfStar = YES;
    }
    
    for (int i=0;i<StarCount;i++) {
        if (i<starInt) {
            imageName = @"quanxin.png";
        } else if (i == starInt && hasHalfStar) {
            imageName = @"banxin.png";
        } else {
            imageName = @"kongxin.png";
        }
        UIImage *image = [UIImage imageNamed:imageName];
        CGFloat width = image.size.width;
        CGFloat height = image.size.height;
        [image drawInRect:CGRectMake((width+2)*i, (rect.size.height-height)*.5f, width, height)];
    }
    
}

@end
