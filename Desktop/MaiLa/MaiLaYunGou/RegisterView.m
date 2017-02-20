//
//  RegisterView.m
//  MaiLaYunGou
//
//  Created by Luffy on 17/2/10.
//  Copyright © 2017年 Luffy. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
@implementation RegisterSuperView
+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] firstObject];
}

- (void)dismissAnimation {
    CGRect rect = self.frame;
    rect.origin.x = -rect.size.width;
    self.frame = rect;
    self.alpha = 0;
}

- (void)showAnimation {
    [UIView animateWithDuration:.25f animations:^{
        CGRect rect = self.frame;
        rect.origin.x = 0;
        self.frame = rect;
        self.alpha = 1;
    }];
    
}

@end

@implementation RegisterView1
+ (id)newInstance {
    id view = [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] firstObject];
    return view;
}
@end
@implementation RegisterView2

+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] objectAtIndex:1];
}
- (IBAction)sendCode:(id)sender {
    self.sendCodeBlock();
}

@end
@implementation RegisterView3

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.roleButton1 setImage:[UIImage imageNamed:@"gouxuan.png"] forState:UIControlStateSelected];
    [self.roleButton2 setImage:[UIImage imageNamed:@"gouxuan.png"] forState:UIControlStateSelected];
    [self.roleButton3 setImage:[UIImage imageNamed:@"gouxuan.png"] forState:UIControlStateSelected];
}

- (IBAction)selectRole:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]] && button != sender) {
            button.selected = NO;
        }
    }
}

- (NSString *)role {
    if (self.roleButton1.isSelected) {
        return @"student";
    } else if (self.roleButton2.isSelected) {
        return @"socialuser";
    }else if (self.roleButton3.isSelected) {
        return @"business";
    } else {
        return @"";
    }
}

+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] objectAtIndex:2];
}
@end

@implementation RegisterView4
+ (id)newInstance {
    return [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] objectAtIndex:3];
}


@end




