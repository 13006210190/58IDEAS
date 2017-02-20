//
//  RegistBottomView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/10.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "RegistBottomView.h"

@implementation RegistBottomView
+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"RegistBottomView" owner:self options:nil] firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.button setBackgroundImage:[UIImage imageNamed:@"zhuce2.png"] forState:UIControlStateHighlighted];
}

- (IBAction)buttonClick:(id)sender {
    [self.delegate bottomViewClick:sender];
}

- (IBAction)yueduClick:(id)sender {
    
}
- (IBAction)xieyiClick:(id)sender {
    
}

@end
