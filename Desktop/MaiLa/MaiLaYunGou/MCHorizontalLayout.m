//
//  CustomLayout.m
//  CollectionViewTest
//
//  Created by maomao on 14/12/30.
//  Copyright (c) 2014年 maomao. All rights reserved.
//

#import "MCHorizontalLayout.h"

@implementation MCHorizontalLayout
- (void)prepareLayout {
    [super prepareLayout];
}

- (CGSize)itemSize {
    CGSize size = self.collectionView.frame.size;
    size.height -= (self.collectionView.contentInset.top + self.collectionView.contentInset.bottom);
    return size;
}

- (CGSize)collectionViewContentSize {
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(self.itemSize.width * count, self.itemSize.height);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(self.itemSize.width * indexPath.row, 0, self.itemSize.width, self.itemSize.height);
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [array addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return array;
}

@end
