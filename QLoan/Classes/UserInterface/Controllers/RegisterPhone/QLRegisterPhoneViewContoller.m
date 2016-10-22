//
//  QLRegisterPhoneViewContoller.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRegisterPhoneViewContoller.h"

#import "QLBankAuthService.h"

static NSString * const QLRegisterVerifyPhoneSegue = @"verifyCodeSegue";

@interface QLRegisterPhoneViewContoller ()

@end

@implementation QLRegisterPhoneViewContoller

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.phoneTextField becomeFirstResponder];
    [self configureAppearance];
}

#pragma mark - IBActions

- (void)getCodeButtonPressed:(id)sender {
    NSString *phoneNumber = self.phoneTextField.text;
    [self.bankAuthService registerWithPhoneNumber:phoneNumber
                                       completion:^(BOOL success, NSError *error) {
                                           if (success) {
                                               [self performSegueWithIdentifier:QLRegisterVerifyPhoneSegue
                                                                         sender:self];
                                           }
                                       }];
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.getCodeButton addGradient];
}

@end
