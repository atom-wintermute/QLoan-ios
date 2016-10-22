//
//  QLRegisterViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRegisterViewController.h"

#import "QLBankAuthService.h"

static NSString * const QLRegisterOfferSegue = @"registerOfferSegue";

@implementation QLRegisterViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view layoutIfNeeded];
    [self.passwordTextField becomeFirstResponder];
    [self configureAppearance];
}

#pragma mark - IBActions

- (void)dataWasChanged:(id)sender {
    if (self.passwordTextField.text.length &&
        self.repeatPasswordTextField.text.length &&
        self.emailTextField.text.length &&
        self.firstNameTextField.text.length &&
        self.secondNameTextField.text.length) {
        [self.continueButton activate:YES];
    } else {
        [self.continueButton activate:NO];
    }
}

- (void)continueButtonWasPressed:(id)sender {
    [self.bankAuthService editUserDataWithEmail:self.emailTextField.text
                                      firstName:self.firstNameTextField.text
                                       lastName:self.secondNameTextField.text
                                     completion:^(BOOL success, NSError *error) {
                                         if (success) {
                                             [self changePassword];
                                         } else {
                                             UIAlertController *alerController;
                                             if (15 == error.code) {
                                                 alerController = [UIAlertController errorAlertControllerWithTitle:@"Неверный формат адреса электронной почты"];
                                             } else {
                                                 alerController = [UIAlertController standartErrorAlertController];
                                             }
                                             [self presentViewController:alerController
                                                                animated:YES
                                                              completion:nil];
                                         }
                                     }];
}

#pragma mark - Приватные методы

- (void)changePassword {
    [self.bankAuthService changePasswordWithPassword:self.passwordTextField.text
                                          completion:^(BOOL success, NSError *error) {
                                              if (success) {
                                                  [self.bankAuthService updateCurrentUserDataWithCompletion:nil];
                                                  [self performSegueWithIdentifier:QLRegisterOfferSegue
                                                                            sender:self];
                                              } else {
                                                  UIAlertController *alerController;
                                                  if (21 == error.code) {
                                                      alerController = [UIAlertController errorAlertControllerWithTitle:@"Неверный формат пароля"];
                                                  } else {
                                                      alerController = [UIAlertController standartErrorAlertController];
                                                  }
                                                  [self presentViewController:alerController
                                                                     animated:YES
                                                                   completion:nil];
                                              }
                                          }];
}

- (void)configureAppearance {
    [self.continueButton activate:NO];
}

@end
