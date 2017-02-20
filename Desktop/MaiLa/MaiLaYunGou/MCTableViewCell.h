//
//  MCTableViewCell.h
//  MCKit
//
//  Created by Luffy on 16/4/1.
//  Copyright © 2016年 58. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCTableViewCell : UITableViewCell

+ (CGFloat)height;
+ (NSString *)identifier;
+ (id)cellForTable:(UITableView *)tableview;
+ (id)cellForTable:(UITableView *)tableview style:(UITableViewCellStyle)style;
+ (id)cellForTable:(UITableView *)tableview style:(UITableViewCellStyle)style identifier:(NSString *)identifier;

@end
