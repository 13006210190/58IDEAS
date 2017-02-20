//
//  MCTableViewController.m
//  Snacks
//
//  Created by ios0190 on 15/11/16.
//  Copyright © 2015年 ios0190. All rights reserved.
//

#import "MCTableViewController.h"
#import "UIColor+UIColorExtension.h"

@interface MCTableViewController ()

@end

@implementation MCTableViewController
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super init];
    if (self) {
        _tableViewStyle = style;
    }
    return self;
}

- (Class)tableClass {
    return [UITableView class];
}

- (void)loadTableView:(CGRect)rect {
    UITableView *tableView = [[[self tableClass] alloc] initWithFrame:rect style:_tableViewStyle];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = HEX_COLOR(0xe6e6e6);
    _tableView.separatorInset = UIEdgeInsetsZero;
    [self configTableView:_tableView];

    [self.view addSubview:_tableView];
}

- (void)configTableView:(UITableView *)tableView {
    tableView.backgroundColor = HEX_COLOR(0xe6e6e6);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (UITableView *)tableView {
    if (!_tableView) {
        [self loadTableView:self.view.bounds];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_tableView == nil) {
        [self loadTableView:self.view.bounds];
    }
    self.tableView.tableFooterView = [UIView new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.keepSelectStateWhenAppear) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath) {
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
