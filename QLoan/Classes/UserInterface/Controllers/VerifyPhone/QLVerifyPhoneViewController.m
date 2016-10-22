//
//  QLVerifyPhoneViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLVerifyPhoneViewController.h"

#import "QLBankAuthService.h"

static NSString * const QLVerifyRegisterSegue = @"registerSegue";

@interface QLVerifyPhoneViewController ()

@end

@implementation QLVerifyPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.codeTextField becomeFirstResponder];
    [self configureAppearance];
}

#pragma mark - IBActions

- (void)registerButtonWasPressed:(id)sender {
    NSString *codeString = self.codeTextField.text;
    [self.bankAuthService verifyPhoneNumberWithCode:codeString
                                         completion:^(BOOL success, NSError *error) {
                                             if (success) {
                                                 [self performSegueWithIdentifier:QLVerifyRegisterSegue
                                                                           sender:self];
                                             }
                                         }];
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.registerButton addGradient];
}

@end
