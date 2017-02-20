//
//  MCNavigationView.m
//  CollectionViewTest
//
//  Created by maomao on 14/12/30.
//  Copyright (c) 2014年 maomao. All rights reserved.
//

#import "MCNavigationView.h"


@implementation NavigationItemUnderLine
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor textRedColor] CGColor]);
    CGContextFillRect(context, CGRectInset(rect, CGRectGetWidth(rect)*0.2, 0));
}

@end




@implementation MCNavigationItem
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = HEX_COLOR(0x0da898);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        [self setLabel: label];
        [label setFont:[UIFont systemFontOfSize:13]];
        [label setTextColor:[UIColor textColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:label];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize result = [self.label sizeThatFits:size];
    result.width += 30;
    return result;
}

- (void)setShowSepreatLine:(BOOL)showSepreatLine {
    if (_showSepreatLine != showSepreatLine) {
        _showSepreatLine = showSepreatLine;
        if (showSepreatLine) {
            if (_seratorLine == nil) {
                UIImage *image = [UIImage imageNamed:@"sline_.png"];
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                _seratorLine = imageView;
                [self addSubview:imageView];
            }
            _seratorLine.hidden = NO;
        } else {
            _seratorLine.hidden = YES;
        }
    }
}

- (void)layoutSubviews {
    [self.label setFrame:self.bounds];
    if (_seratorLine) {
        CGSize size = self.frame.size;
        CGRect frame = _seratorLine.frame;
        frame.origin.x = size.width - frame.size.width;
        frame.origin.y = 10;
        frame.size.height = size.height - 20;
        _seratorLine.frame = frame;
    }
}
@end

@interface MCNavigationView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) NavigationItemUnderLine *underlineView;
@property (nonatomic, assign) CGFloat preOffsetX;
@end
@implementation MCNavigationView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIScrollView *view = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.scrollView = view;
        [view setShowsHorizontalScrollIndicator:NO];
        [view setDelegate:self];
        [self addSubview:view];
        
        NavigationItemUnderLine *underlineView = [[NavigationItemUnderLine alloc] initWithFrame:CGRectMake(0, 0, 1, 3)];
        self.underlineView = underlineView;
        underlineView.layer.cornerRadius = 1;

        [view addSubview:underlineView];
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    if (_titles != titles) {
        _titles = titles;
        [self reloadButtons:titles];
    }
}

- (void)reloadButtons:(NSArray *)titles {
    [self.buttons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:titles.count];
    NSInteger index = 0;
    for (NSString *item in titles) {
        MCNavigationItem *navigationItem = [MCNavigationItem new];
        navigationItem.label.text = item;
        [navigationItem sizeToFit];
        [navigationItem setShowSepreatLine:YES];
        navigationItem.index = index++;
        [navigationItem addTarget:self action:@selector(handleTaped:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:navigationItem];
        [array addObject:navigationItem];
    }
    self.buttons = array;
    [self.scrollView bringSubviewToFront:self.underlineView];
    [self.underlineView setNeedsDisplay];
    [self setNeedsLayout];
}

- (void)setItemFont:(UIFont *)itemFont {
    if (_itemFont != itemFont) {
        _itemFont = itemFont;
        
        for (MCNavigationItem *item in self.buttons) {
            item.label.font = itemFont;
        }
    }
}

- (void)handleTaped:(MCNavigationItem *)item {
    if (_currentIndex != item.index) {
        _currentIndex = item.index;
        
        if (self.updateUnderLineBySelf) {
            CGRect frame = self.underlineView.frame;
            frame.origin.x = item.frame.origin.x;
            frame.size.width = item.frame.size.width;
            self.underlineView.frame = frame;
        }
        
        [self.delegate navigationView:self didChangeIndex:item.index];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        return;
    }
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    if (offsetX == 0) {
        UIView *view = [self.buttons firstObject];
        CGRect frame = self.underlineView.frame;
        frame.origin.x = 0;
        frame.size.width = view.frame.size.width;
        self.underlineView.frame = frame;
    } else {
        CGFloat scrollWidth = scrollView.bounds.size.width;
        NSInteger index = ceilf(offsetX / scrollWidth);
        
        UIView *currentItem = [self.buttons objectAtIndex:index - 1];
        UIView *targetItem = [self.buttons objectAtIndex:index];
        CGRect currentItemFrame = currentItem.frame;
        CGRect targetItemFrame = targetItem.frame;
        CGFloat percent = (offsetX - (index - 1) * scrollWidth) / scrollWidth;

        CGFloat deltaWidth = targetItemFrame.size.width - currentItemFrame.size.width;
        CGFloat deltaX = targetItemFrame.origin.x - currentItemFrame.origin.x;

        CGRect frame = self.underlineView.frame;
        frame.origin.x = currentItemFrame.origin.x + deltaX * percent;
        frame.size.width = currentItemFrame.size.width + deltaWidth * percent;
        self.underlineView.frame = frame;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        return;
    }
    NSInteger index = floor(scrollView.contentOffset.x / scrollView.frame.size.width);
    _currentIndex = index;
    
    UIView *view = [self.buttons objectAtIndex:index];
    CGRect frame = [view frame];
    CGFloat centerX = self.scrollView.frame.size.width * 0.5f;
    CGFloat viewCenterX = CGRectGetMidX(frame);
    CGFloat offsetX = self.scrollView.contentOffset.x;
    
    CGFloat delta = centerX - viewCenterX;
    offsetX -= delta;
    if (offsetX < 0) {
        offsetX = 0;
    } else {
        CGFloat max = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
        if (offsetX > max) {
            offsetX = max;
        }
    }
    
    if (offsetX != self.scrollView.contentOffset.x) {
        [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    [self.scrollView setFrame:bounds];
    
    NSInteger count = self.buttons.count;
    CGFloat minWidth = bounds.size.width / count;
    CGFloat height = bounds.size.height;
    CGFloat x = 0;
    for (MCNavigationItem *item in self.buttons) {
        CGRect itemFrame = item.bounds;
        CGFloat width = MAX(itemFrame.size.width,minWidth);
        itemFrame.origin.x = x;
        itemFrame.size.width = width;
        itemFrame.size.height = height;
        x += width;
        item.frame = itemFrame;
        
        if (item.index == self.currentIndex) {
            CGRect frame = self.underlineView.frame;
            frame.origin.x = item.frame.origin.x;
            frame.origin.y = height - frame.size.height;
            frame.size.width = width;
            self.underlineView.frame = frame;
        }
    }
    self.scrollView.contentSize = CGSizeMake(x, height);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [HEX_COLOR(0xe6e6e6) setStroke];
    [path moveToPoint:CGPointMake(0, rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    [path setLineWidth:1.f];
    [path stroke];
}

@end
