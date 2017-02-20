//
//  ConfirmCodeButton.m
//  DingDang
//
//  Created by Luffy on 16/12/5.
//  Copyright © 2016年 Luffy. All rights reserved.
//

#import "ConfirmCodeButton.h"

@interface ConfirmCodeButton () {
    BOOL _setTitleByTimer;
}
@property (nonatomic, strong) NSString *originTitle;
@property (nonatomic, assign) NSTimeInterval startDate;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation ConfirmCodeButton

- (void)resetRemainTime {
    self.startDate = [[NSDate date] timeIntervalSince1970];
    [self startTimeCount];
}

- (void)startTimeCount {
    if (self.timer) {
        return;
    }
    if ([[NSDate date] timeIntervalSince1970] - self.startDate < 60) {
        [self handleTimer:nil];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    }
}

- (void)stopTimeCount {
    [[self timer] invalidate];
    [self setTimer:nil];
}

- (void)handleTimer:(id)sener {
    NSInteger interval = [[NSDate date] timeIntervalSince1970] - self.startDate;
    if (interval > 60) {
        [self setEnabled:YES];
        [[self timer] invalidate];
        [self setTimer:nil];
    } else {
        [self setEnabled:NO];
        [self setTitle:[@(60 - interval) stringValue] forState:UIControlStateDisabled];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow) {
        [self startTimeCount];
    } else {
        [self stopTimeCount];
    }
}

- (BOOL)checkPhone:(NSString *)phone error:(NSString *__autoreleasing *)error {
    if (phone.length == 0) {
        *error = @"请输入手机号";
        return NO;
    } else if (!phone) {
        *error = @"请输入正确的手机号";
        return NO;
    }
    return YES;
}
@end
