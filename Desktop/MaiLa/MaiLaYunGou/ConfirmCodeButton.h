//
//  ConfirmCodeButton.h
//  DingDang
//
//  Created by Luffy on 16/12/5.
//  Copyright © 2016年 Luffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmCodeButton : UIButton

- (void)resetRemainTime;
- (void)startTimeCount;
- (void)stopTimeCount;
- (BOOL)checkPhone:(NSString *)phone error:(NSString **)error;

@end
