//
//  UIViewController+Login.m
//  Craftsman
//
//  Created by Luffy on 16/12/26.
//  Copyright © 2016年 Luffy. All rights reserved.
//

#import "UIViewController+Login.h"



@implementation UIViewController (Login)

- (void)pushController:(UIViewController *)controller {
    if (NO) {
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        [self presentViewController:[LoginViewController loginViewController] animated:YES completion:nil];
    }
}

@end
