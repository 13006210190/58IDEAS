//
//  DeskHeaderView.h
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeskHeaderView : UIView<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong)NSMutableArray *items;
@property (nonatomic, strong)NSArray *dataArray;

@property (nonatomic, copy)void(^clickItemBlock)(NSInteger index);
@end
