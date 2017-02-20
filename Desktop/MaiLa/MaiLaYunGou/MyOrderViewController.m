//
//  MyOrderViewController.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/9.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "MyOrderViewController.h"

#import "MyOrderCell.h"

@interface MyorderItem : UIControl
@property (weak, nonatomic)  UIImageView *imageview;
@property (weak, nonatomic)  UILabel *nameLabel;
@end
@implementation MyorderItem

- (UIImageView *)imageview {
    if (!_imageview) {
        UIImageView *imageview = [UIImageView new];
        [self addSubview:imageview];
        _imageview = imageview;
    }
    return _imageview;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        UILabel *label = [UILabel new];
        label.font = Font(15);
        label.textColor = [UIColor textColor];
        [self addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (void)config:(NSString *)name title:(NSString *)title {
    self.imageview.image = [UIImage imageNamed:name];
    self.nameLabel.text = title;
    [self.imageview sizeToFit];
    [self.nameLabel sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.imageview.frame;
    rect.origin.x = (self.frame.size.width-rect.size.width)*.5f;
    rect.origin.y = 20;
    self.imageview.frame = rect;
    
    rect = self.nameLabel.frame;
    rect.origin.x = (self.frame.size.width-rect.size.width)*.5f;
    rect.origin.y = CGRectGetMaxY(self.imageview.frame)+8;
    self.nameLabel.frame = rect;
    
}

@end

@interface MyOrderHeaderView : UIView
@property (nonatomic, strong)MyorderItem *item1;
@property (nonatomic, strong)MyorderItem *item2;
@property (nonatomic, strong)MyorderItem *item3;
@property (nonatomic, copy)void(^buttonClickBlock)(NSInteger index);
@end

@implementation MyOrderHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    self.item1 = [self itemWithImage:@"quanbu.png" title:@"全部" tag:100];
    self.item2 = [self itemWithImage:@"daipingjia" title:@"待评价"tag:101];
    self.item3 = [self itemWithImage:@"tuikuan" title:@"退款" tag:102];
    
    return self;
}

- (void)click:(UIControl *)sender {
    self.buttonClickBlock(sender.tag-100);
}

- (MyorderItem *)itemWithImage:(NSString *)image title:(NSString *)title tag:(NSInteger)tag{
    MyorderItem *item = [MyorderItem new];
    item.tag = tag;
    [item addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [item config:image title:title];
    [self addSubview:item];
    return item;
}

- (void)layoutSubviews {
    CGFloat width = self.frame.size.width/3.f;
    self.item1.frame = CGRectMake(0, 0, width, self.frame.size.height);
    self.item2.frame = CGRectMake(width, 0, width, self.frame.size.height);
    self.item3.frame = CGRectMake(width*2, 0, width, self.frame.size.height);
}

@end

@interface MyOrderViewController ()

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyOrderHeaderView *header = [[MyOrderHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];

    __weak typeof (self)weakSelf = self;
    [header setButtonClickBlock:^(NSInteger index) {
        
    }];
    [self.view addSubview:header];
    
     UIEdgeInsets inset = self.tableView.contentInset;
    inset.top = 90.f;
    self.tableView.contentInset = inset;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyOrderCell *cell = [MyOrderCell cellForTable:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = HEX_COLOR(0xe6e6e6);
    UILabel *label = [UILabel new];label.frame = CGRectMake(20, 0, 50, 20);
    label.text = @"订单";
    label.textColor = HEX_COLOR(0x666666);
    [view addSubview:label];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
