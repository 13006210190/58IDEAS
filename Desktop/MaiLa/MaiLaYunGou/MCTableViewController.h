//
//  MCTableViewController.h
//  Snacks
//
//  Created by ios0190 on 15/11/16.
//  Copyright © 2015年 ios0190. All rights reserved.
//

#import "MCViewController.h"


@interface MCTableViewController : MCViewController<UITableViewDataSource,UITableViewDelegate> {
    @package
    UITableViewStyle _tableViewStyle;
}
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) BOOL keepSelectStateWhenAppear;
- (id)initWithStyle:(UITableViewStyle)style;
- (Class)tableClass;
- (void)loadTableView:(CGRect)rect;
- (void)configTableView:(UITableView *)tableView;

@end
