//
//  RegistBottomView.h
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/10.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RegistBottomViewDelegate <NSObject>

- (void)bottomViewClick:(UIButton *)button;

@end

@interface RegistBottomView : UIView
@property (nonatomic, weak)id<RegistBottomViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIButton *button;
+ (id)newInstance;
@end
