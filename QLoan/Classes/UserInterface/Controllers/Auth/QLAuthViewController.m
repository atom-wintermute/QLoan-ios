//
//  QLAuthViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAuthViewController.h"

#import "QLBankAuthService.h"
#import "QLBankCardService.h"
#import "QLAuthorizationService.h"

#import "QLTabBarController.h"

static NSString * const QLAuthRegisterSegue = @"registerSegue";

@interface QLAuthViewController () <UITextFieldDelegate>

@end

@implementation QLAuthViewController

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
    
    [self configureAppearance];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - IBActions

- (void)fastLoginButtonWasPressed:(id)sender {
    self.loginTextField.text = @"9139381557";
    self.passwordTextField.text = @"29111990m";
	[self loginButtonWasPressed:nil];
}

- (void)forgetPasswordButtonWasPressed:(id)sender {
    
}

- (void)loginButtonWasPressed:(id)sender {
    NSString *loginString = self.loginTextField.text;
    NSString *passwordString = self.passwordTextField.text;
	
	QLBooleanCompletion localAuthCompletion = ^(BOOL success, NSError *error) {
		if (success) {
			[self loginCompleted];
		} else {
			[self showErrorAlert];
		}
	};
	
	QLBankAuthCompletion bankAuthLoginCompletion = ^(BOOL success, NSError *error) {
		if (success) {
			[self.authorizationService authorizeWithCompletion:localAuthCompletion];
		} else {
			[self showErrorAlert];
		}
	};
	
    [self.bankAuthService loginWithLogin:loginString
                                password:passwordString
                              completion:bankAuthLoginCompletion];
}

- (void)registerButtonWasPressed:(id)sender {
    [self performSegueWithIdentifier:QLAuthRegisterSegue
                              sender:self];
}

- (void)dataWasChanged:(id)sender {
    if (self.loginTextField.text.length &&
        self.passwordTextField.text.length) {
        [self.loginButton activate:YES];
    } else {
        [self.loginButton activate:NO];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    if (textField == self.loginTextField) {
        if (0 == range.location) {
            NSString *resultString = [NSString stringWithFormat:@"+7 %@", string];
            textField.text = resultString;
            return NO;
        }
    }
    return YES;
}

#pragma mark - Авторизация в локальном бекэнде

- (void)loginCompleted {
    [self.bankAuthService updateCurrentUserDataWithCompletion:nil];
    [self.bankCardService updateBankCardsWithCompletion:nil];
    
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    QLTabBarController *tabBarController = (QLTabBarController *)[mainWindow rootViewController];
    [tabBarController selectTabWithIndex:3];
    
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

#pragma mark - Приватные методы

- (void)keyboardWillShow:(NSNotification *)notification {
    self.topConstraint.constant = -122.0;
    [self.view layoutIfNeeded];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.topConstraint.constant = 0.0;
    [self.view layoutIfNeeded];
}

- (void)showErrorAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Не удалось авторизоваться"
                                                                             message:@"Неверная пара логин/пароль"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    [self.loginButton activate:NO];
}

@end
