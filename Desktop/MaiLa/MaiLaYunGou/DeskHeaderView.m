//
//  DeskHeaderView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "DeskHeaderView.h"

@interface DeskClassItem : UIControl
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation DeskClassItem

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.layer.cornerRadius = 6.f;
        _imageView.layer.masksToBounds = YES;
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = Font(13);
        _titleLabel.textColor = [UIColor textColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.imageView.bounds;
    rect.origin.x = (self.frame.size.width - rect.size.width)*.5f;
    rect.origin.y = (self.frame.size.height - rect.size.height-30)*.5f;
    self.imageView.frame = rect;
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+10, self.frame.size.width, 20);
}
@end

@implementation DeskHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.delegate = self;
    self.contentView.showsHorizontalScrollIndicator = NO;
    self.contentView.pagingEnabled = YES;
    self.pageControl.pageIndicatorTintColor = HEX_COLOR(0x999999);
    self.pageControl.currentPageIndicatorTintColor = HEX_COLOR(0xdd2727);
    self.pageControl.userInteractionEnabled  = NO;
    //[self.pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setDataArray:(NSArray *)dataArray {
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        [_dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DeskClassItem *item = [DeskClassItem new];
            item.imageView.image = [UIImage imageNamed:@"jipiao.png"];
            [item.imageView sizeToFit];
            item.titleLabel.text = @"按摩足疗";
            [self.contentView addSubview:item];
            [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = idx;
            [self.items addObject:item];
        }];
        NSInteger countX = self.contentView.frame.size.width >320 ? 5.f:4.f;
        NSInteger pages =ceil(dataArray.count/(countX*2.f));
        self.pageControl.numberOfPages = pages;
        self.contentView.contentSize = CGSizeMake(self.frame.size.width * self.pageControl.numberOfPages, self.contentView.frame.size.height);
    }
    [self setNeedsLayout];
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (void)layoutContent {
    NSInteger countX = self.contentView.frame.size.width >320 ? 5.f:4.f;
    CGFloat width   = self.contentView.frame.size.width/countX;
    CGFloat height  = 80.f;
    
    for (int i =0; i<self.items.count ;i++) {
        UIView *view = self.items[i];
        if (i >= countX*2) {
            NSInteger y =(i-countX*2)/countX ;
            view.frame = CGRectMake(self.contentView.frame.size.width + width * (i%countX) , height*y,width,height);
        } else {
            NSInteger y =i/countX ;
            NSInteger x =i%countX;
            CGRect rect = CGRectMake(width * x , height*y,width,height);
            view.frame = rect;
        }
    }
}

- (void)itemClick:(UIControl *)view {
    if (self.clickItemBlock) {
        self.clickItemBlock(view.tag);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    CGRect rect = scrollView.frame;
    NSInteger index = floor(scrollView.contentOffset.x / rect.size.width);
    self.pageControl.currentPage = index;
    self.pageControl.hidden = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutContent];
}

@end
