//
//  HotGoodTableViewCell.h
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "MCNibTableViewCell.h"
#import "StarView.h"

@interface HotGoodTableViewCell : MCNibTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icomImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet StarView *starview;

@end
