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

@interface QLRegisterViewController () <UITextFieldDelegate>

@end

@implementation QLRegisterViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [self.view layoutIfNeeded];
    [self.passwordTextField becomeFirstResponder];
    [self configureAppearance];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    if (textField == self.firstNameTextField || textField == self.secondNameTextField) {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range
                                                                      withString:string];
        if (newString.length > 21) {
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - Приватные методы

- (void)keyboardWillShow:(NSNotification *)notification {
    self.bottomConstraint.constant = CGRectGetHeight([notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue]);
    
    [self.view layoutIfNeeded];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.bottomConstraint.constant = 0.0;
    [self.view layoutIfNeeded];
}

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
