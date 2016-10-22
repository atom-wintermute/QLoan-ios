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

static NSUInteger const QLVerifyCodeLenght = 6;

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
                                             } else {
                                                 UIAlertController *alertController;
                                                 if (106 == error.code) {
                                                     alertController = [UIAlertController errorAlertControllerWithTitle:@"Неверно указан код активации"];
                                                 } else {
                                                     alertController = [UIAlertController standartErrorAlertController];
                                                 }
                                                 [self presentViewController:alertController
                                                                    animated:YES
                                                                  completion:nil];
                                             }
                                         }];
}

- (void)codeTextFieldValueChanged:(id)sender {
    NSUInteger phoneLength = self.codeTextField.text.length;
    if (phoneLength >= QLVerifyCodeLenght) {
        [self.registerButton activate:YES];
    } else {
        [self.registerButton activate:NO];
    }
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.registerButton activate:NO];
}

@end
