//
//  MCViewController.m
//  Snacks
//
//  Created by ios0190 on 15/11/16.
//  Copyright © 2015年 ios0190. All rights reserved.
//

#import "MCViewController.h"

@interface MCViewController (){

BOOL _notificationRegisted;

}

@end

@implementation MCViewController

- (id)init {
    self = [super init];
    if (self) {
        [self initializeController];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initializeController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeController];
    }
    return self;
}

- (void)initializeController {
    //    self.viewControllerBarStye = ViewControllerBarStyleTransant;
}

- (NSArray *)introduceImagesForViewController {
    return nil;
}

- (CGPoint)introduceLocation {
    return CGPointMake(self.view.frame.size.width - 70, 130);
}

- (CGFloat)viewControllerTopMargin {
    if (self.navigationController.navigationBar.translucent) {
        return CGRectGetMaxY(self.navigationController.navigationBar.frame);
    } else {
        return 0;
    }
}

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view setOpaque:YES];
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!_notificationRegisted) {
        _notificationRegisted = YES;
        [self registNotifications];
    }
}

- (void)registNotifications {
    
}

- (void)resignNotifications {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    _notificationRegisted = NO;
    [self resignNotifications];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidUnload {
    [super viewDidUnload];

}

- (void)viewWillUnload {
    [super viewWillUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)dealloc {
#ifdef DEBUG
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
#endif
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
