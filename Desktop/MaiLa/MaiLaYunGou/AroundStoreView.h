//
//  AroundStoreView.h
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/13.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
@interface AroundStoreView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet StarView *starview;
+ (id)instance;

@end
