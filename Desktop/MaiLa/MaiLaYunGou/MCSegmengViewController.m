//
//  MCSegmengViewController.m
//  CollectionViewTest
//
//  Created by maomao on 14/12/31.
//  Copyright (c) 2014年 maomao. All rights reserved.
//

#import "MCSegmengViewController.h"
#import "MCNavigationView.h"
#import "MCHorizontalLayout.h"


@interface SegmentCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIView *view;
@end

@implementation SegmentCollectionViewCell
- (void)setView:(UIView *)view {
    if (_view != view) {
        [_view removeFromSuperview];
        _view = view;
        if (view) {
            [self.contentView addSubview:view];
        }
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.view setFrame:self.contentView.bounds];
}
@end

NSString *const GROUP_COLLECTION_CELL_KEY = @"groupCollectionCellKey";
NSString *const PLAIN_COLLECTION_CELL_KEY = @"plainCollectionCellKey";
@interface MCSegmengViewController ()<MCNavigationViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate> {
    BOOL _controllerHasAppeared;
}
@property (nonatomic, strong) NSMutableDictionary *cachedCells;
@property (nonatomic, strong) NSMutableArray *dataSourceContainer;

@end
@implementation MCSegmengViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

- (void)initialize {
    MCHorizontalLayout *layout = [[MCHorizontalLayout alloc] init];
    
    UICollectionView *view = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    view.showsHorizontalScrollIndicator = NO;
    [view setBackgroundColor:[UIColor clearColor]];
    [self setCollectionView:view];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [view setPagingEnabled:YES];
    [view registerClass:[SegmentCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    [view setDataSource:self];
    [view setDelegate:self];
    [self.view addSubview:view];
    
    if (!self.navigationViewHidden) {
        MCNavigationView *view2 = [[MCNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        view2.delegate = self;
        view2.titles = [self navigationTitles];
        view2.backgroundColor = [UIColor whiteColor];
        [self setNavigationView:view2];
        [self.view addSubview:view2];
    }

    [view setContentInset:UIEdgeInsetsMake(self.navigationView.frame.size.height, 0, 0, 0)];
    [self.collectionView setBounces:NO];
    
}

- (void)setTitleFont:(UIFont *)titleFont {
    if (_titleFont != titleFont) {
        _titleFont = titleFont;
        self.navigationView.itemFont = titleFont;
    }
}

- (id)dataSourceAtIndex:(NSInteger)index {
    if (index < self.dataSourceContainer.count) {
        id result = [self.dataSourceContainer objectAtIndex:index];
        if (result == [NSNull null]) {
            return nil;
        } else {
            return result;
        }
    }
    return nil;
}

- (void)setDataSource:(id)dataSource forIndex:(NSInteger)index {
    if (self.dataSourceContainer == nil) {
        NSInteger count = [self navigationTitles].count;
        self.dataSourceContainer = [NSMutableArray arrayWithCapacity:count];
        for (int  i = 0; i < count; i++) {
            [self.dataSourceContainer addObject:[NSNull null]];
        }
    }
    if (dataSource) {
        [self.dataSourceContainer replaceObjectAtIndex:index withObject:dataSource];
    } else {
        [self.dataSourceContainer replaceObjectAtIndex:index withObject:[NSNull null]];
    }
}

- (void)setNavigationTitles:(NSArray *)navigationTitles {
    if (_navigationTitles != navigationTitles) {
        _navigationTitles = navigationTitles;
        self.navigationView.titles = navigationTitles;
        
        [self.collectionView reloadData];
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.navigationTitles.count;
}


- (UIView *)cachedViewAtIndex:(NSInteger)index {
    NSString *key = [NSString stringWithFormat:@"cell_%ld",(long)index];
    UIView *view = [_cachedCells objectForKey:key];
    if (view == nil) {
        view = [self initializeContentViewForIndex:index];
        if (view) {
            if (self.cachedCells == nil) {
                self.cachedCells = [NSMutableDictionary dictionary];
            }
            [self.cachedCells setObject:view forKey:key];
        }
    }
    return view;
}

- (UIViewController *)cachedViewControllerAtIndex:(NSInteger)index {
    NSString *key = [NSString stringWithFormat:@"cell_%ld",(long)index];
    UIViewController *controller = [_cachedViewController objectForKey:key];
    if (controller == nil) {
        controller = [self initializeContentViewControllerForIndex:index];
        if (controller) {
            if (self.cachedViewController == nil) {
                self.cachedViewController = [NSMutableDictionary dictionary];
            }
            [self.cachedViewController setObject:controller forKey:key];
        }
    }
    return controller;
}

- (void)setContentInvaliate {
    self.cachedCells = nil;
    self.cachedViewController = nil;
    self.dataSourceContainer = nil;
}

- (UIView *)initializeContentViewForIndex:(NSInteger)index {
    return nil;
}

- (UIViewController *)initializeContentViewControllerForIndex:(NSInteger)index {
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SegmentCollectionViewCell *cell = (SegmentCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    UIViewController *controller = [self cachedViewControllerAtIndex:indexPath.row];
    if (controller) {
        [self addChildViewController:controller];
        [cell setView:controller.view];
        if (!_controllerHasAppeared) {
            [controller viewWillAppear:NO];
            [controller viewDidAppear:NO];
        }
    } else {
        cell.view = [self cachedViewAtIndex:indexPath.row];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        [self.navigationView scrollViewDidScroll:scrollView];
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        return NO;
    }
    return YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        NSInteger index = self.navigationView.currentIndex;
        [self.navigationView scrollViewDidEndDecelerating:scrollView];
        NSInteger index2 = self.navigationView.currentIndex;
        if (index != index2) {
            [self changeToIndex:index2];
        }
    }
}

- (void)changeToIndex:(NSInteger)index {
    [self didChangeToIndex:index];
}

- (void)didChangeToIndex:(NSInteger)index {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self changeToIndex:self.currentIndex];
    if (self.cachedViewController) {
        UIViewController *controller = [_cachedViewController objectForKey:[NSString stringWithFormat:@"cell_%ld",(long)self.currentIndex]];
        [controller viewWillAppear:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _controllerHasAppeared = YES;
}

- (void)navigationView:(MCNavigationView *)view didChangeIndex:(NSInteger)index {
    [self.collectionView setContentOffset:CGPointMake(view.frame.size.width * index, -self.collectionView.contentInset.top) animated:YES];
    [self changeToIndex:index];
}

- (NSInteger)currentIndex {
    return self.navigationView.currentIndex;
}

- (void)segmentContentViewController:(UIViewController *)controller toShowSubViewController:(UIViewController *)subViewController {
    [self.navigationController pushViewController:subViewController animated:YES];
}

- (void)dealloc {
    [self setContentInvaliate];
}

@end
