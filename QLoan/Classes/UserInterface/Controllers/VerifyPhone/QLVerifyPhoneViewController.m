//
//  QLVerifyPhoneViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLVerifyPhoneViewController.h"
#import "QLStorage.h"
#import "QLBankAuthService.h"

static NSString * const QLVerifyRegisterSegue = @"registerSegue";

static NSUInteger const QLVerifyCodeLenght = 6;

@interface QLVerifyPhoneViewController ()

@end

@implementation QLVerifyPhoneViewController

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
    
    [self.codeTextField becomeFirstResponder];
    [self configureAppearance];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark - UITextFieldDelegate 

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range
                                                                  withString:string];
    if (newString.length > 6) {
        return NO;
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

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.registerButton activate:NO];
}

@end
