//
//  MCTableViewCell.m
//  MCKit
//
//  Created by Luffy on 16/4/1.
//  Copyright © 2016年 58. All rights reserved.
//

#import "MCTableViewCell.h"

@implementation MCTableViewCell

+ (NSString *)identifier{
    return NSStringFromClass([self class]);
}

+ (CGFloat)height{
    return 44;
}

+ (id)cellForTable:(UITableView *)tableview {
    return [self cellForTable:tableview style:UITableViewCellStyleDefault];
}


+ (id)cellForTable:(UITableView *)tableview style:(UITableViewCellStyle)style identifier:(NSString *)identifier{
    Class classRef = [self class];
    MCTableViewCell *cell = (MCTableViewCell *)[tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[classRef alloc]initWithStyle:style reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

+ (id)cellForTable:(UITableView *)tableview style:(UITableViewCellStyle)style {
    Class classRef = [self class];
    MCTableViewCell *cell = (MCTableViewCell *)[tableview dequeueReusableCellWithIdentifier:[classRef identifier]];
    if (!cell) {
        cell = [[classRef alloc]initWithStyle:style reuseIdentifier:[classRef identifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


@end
