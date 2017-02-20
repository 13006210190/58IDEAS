//
//  MCNibTableViewCell.m
//  MCKit
//
//  Created by Luffy on 16/4/1.
//  Copyright © 2016年 58. All rights reserved.
//

#import "MCNibTableViewCell.h"

@implementation MCNibTableViewCell

+ (id)newInstance{
    return [self newInstanceFor:self];
}

+ (id)newInstanceFor:(id)owner {
    NSString *str = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:str owner:owner options:nil] lastObject];
}

+ (NSString *)identifier{
    return NSStringFromClass([self class]);
}

+ (CGFloat)height{
    return 50;
}

+ (id)cellForTable:(UITableView *)tableview {
    Class classRef = [self class];
    MCNibTableViewCell *cell = (MCNibTableViewCell *)[tableview dequeueReusableCellWithIdentifier:[classRef identifier]];
    if (!cell) {
        cell = [classRef newInstance];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
