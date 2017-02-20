//
//  MCSegmengViewController.h
//  CollectionViewTest
//
//  Created by maomao on 14/12/31.
//  Copyright (c) 2014年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCViewController.h"
#import "MCNavigationView.h"

@class MCSegmengViewController;
@protocol MCSegmentContentViewControllerProtocol <NSObject>
@property (nonatomic, weak) MCSegmengViewController *segmentViewController;
@end


@interface MCSegmengViewController : MCViewController<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableDictionary *cachedViewController;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger indexWillAppear;
@property (nonatomic, assign) BOOL navigationViewHidden;
@property (nonatomic, strong) NSArray *navigationTitles;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) MCNavigationView *navigationView;

- (void)initialize;
- (void)didChangeToIndex:(NSInteger)index;
- (UIView *)cachedViewAtIndex:(NSInteger)index;
- (UIView *)initializeContentViewForIndex:(NSInteger)index;
- (UIViewController *)initializeContentViewControllerForIndex:(NSInteger)index;
- (id)dataSourceAtIndex:(NSInteger)index;
- (void)setDataSource:(id)dataSource forIndex:(NSInteger)index;
- (UIViewController *)cachedViewControllerAtIndex:(NSInteger)index;
- (void)setContentInvaliate;


@end
