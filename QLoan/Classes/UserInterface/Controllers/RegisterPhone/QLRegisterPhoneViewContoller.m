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

@interface QLRegisterPhoneViewContoller () <UITextFieldDelegate>

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
    NSString *phoneNumberWithoutPrefix = [phoneNumber substringFromIndex:3];
    [self.bankAuthService registerWithPhoneNumber:phoneNumberWithoutPrefix
                                       completion:^(BOOL success, NSError *error) {
                                           if (success) {
                                               [self performSegueWithIdentifier:QLRegisterVerifyPhoneSegue
                                                                         sender:self];
                                           }
                                       }];
}

- (void)phoneTextFieldValueChanged:(id)sender {
    NSUInteger phoneLength = self.phoneTextField.text.length;
    if (phoneLength >= 13) {
        [self.getCodeButton activate:YES];
    } else {
        [self.getCodeButton activate:NO];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    if (0 == range.location) {
        NSString *resultString = [NSString stringWithFormat:@"+7 %@", string];
        textField.text = resultString;
        return NO;
    }
    return YES;
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.getCodeButton activate:NO];
}

@end
