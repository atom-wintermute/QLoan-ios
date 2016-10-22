//
//  QLRegisterPhoneViewContoller.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRegisterPhoneViewContoller.h"
#import "QLStorage.h"
#import "QLBankAuthService.h"

static NSString * const QLRegisterVerifyPhoneSegue = @"verifyCodeSegue";

static NSUInteger const QLRegisterPhoneLenght = 13;

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
											   [self.storage storeObject:phoneNumberWithoutPrefix
																  forKey:@"login"];
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
