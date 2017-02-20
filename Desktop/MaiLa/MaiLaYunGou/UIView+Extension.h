//
//  UIView+Extension.h
//  MCKit
//
//  Created by Luffy on 16/3/17.
//  Copyright © 2016年 58. All rights reserved.
//

#import <UIKit/UIKit.h>


CGFloat MCScreenScale();

static inline CGFloat CGFloatFromPixel(CGFloat value) {
    return value / MCScreenScale();
}

static inline CGFloat ScreenWidth() {
    return [[UIScreen mainScreen] bounds].size.width;
}


@interface UIView (Extension)

- (UIImage *)snapshotImage;

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

- (NSData *)snapshotPDF;

/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

- (void)removeAllSubviews;

@property (nonatomic, readonly) UIViewController *viewController;

@property (nonatomic, readonly) CGFloat visibleAlpha;

- (CGPoint)convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view;

- (CGPoint)convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view;

- (CGRect)convertRect:(CGRect)rect toViewOrWindow:(UIView *)view;

- (CGRect)convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view;

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

@end
