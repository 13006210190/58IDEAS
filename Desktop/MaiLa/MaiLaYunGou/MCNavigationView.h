//
//  MCNavigationView.h
//  CollectionViewTest
//
//  Created by maomao on 14/12/30.
//  Copyright (c) 2014年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationItemUnderLine : UIView
@end

@interface MCNavigationItem : UIControl
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL showSepreatLine;
@property (nonatomic, weak) UIImageView *seratorLine;
@end

@class MCNavigationView;
@protocol MCNavigationViewDelegate <NSObject>
- (void)navigationView:(id)view didChangeIndex:(NSInteger)index;
@end

@interface MCNavigationView : UIView
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, weak) id<MCNavigationViewDelegate> delegate;
@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) BOOL updateUnderLineBySelf;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
@end
