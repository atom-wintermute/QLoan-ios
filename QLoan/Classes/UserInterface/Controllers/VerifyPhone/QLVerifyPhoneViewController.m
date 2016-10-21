//
//  QLVerifyPhoneViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLVerifyPhoneViewController.h"

@interface QLVerifyPhoneViewController ()

@end

@implementation QLVerifyPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.codeTextField becomeFirstResponder];
    [self configureAppearance];
}

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.registerButton addGradient];
}

@end
