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

static NSUInteger const QLRegisterPhoneLenght = 12;

@interface QLRegisterPhoneViewContoller () <UITextFieldDelegate>

@end

@implementation QLRegisterPhoneViewContoller

#pragma mark - Методы жизненного цикла

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
    
    [self.phoneTextField becomeFirstResponder];
    [self configureAppearance];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - IBActions

- (void)getCodeButtonPressed:(id)sender {
    NSString *phoneNumber = self.phoneTextField.text;
    NSString *phoneNumberWithoutPrefix = [phoneNumber substringFromIndex:2];
    [self.bankAuthService registerWithPhoneNumber:phoneNumberWithoutPrefix
                                       completion:^(BOOL success, NSError *error) {
                                           if (success) {
                                               [self performSegueWithIdentifier:QLRegisterVerifyPhoneSegue
                                                                         sender:self];
                                           } else {
                                               UIAlertController *alertController;
                                               if (8 == error.code) {
                                                    alertController = [UIAlertController errorAlertControllerWithTitle:@"Указанный номер телефона уже зарегистрирован в системе"];
                                               } else {
                                                   alertController = [UIAlertController standartErrorAlertController];
                                               }
                                               [self presentViewController:alertController
                                                                  animated:YES
                                                                completion:nil];
                                           }
                                       }];
}

- (void)phoneTextFieldValueChanged:(id)sender {
    NSUInteger phoneLength = self.phoneTextField.text.length;
    if (phoneLength >= QLRegisterPhoneLenght) {
        [self.getCodeButton activate:YES];
    } else {
        [self.getCodeButton activate:NO];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range
                                                                  withString:string];
    if (newString.length > 12) {
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
    [self.getCodeButton activate:NO];
}

@end
