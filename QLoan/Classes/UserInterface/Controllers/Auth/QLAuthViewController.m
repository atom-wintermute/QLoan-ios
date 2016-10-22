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
#import "QLAuthorizationRequestConfiguration.h"
#import "QLStorage.h"
#import "QLFullScreenAnimations.h"

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
    self.loginTextField.text = @"+71234567891";
    self.passwordTextField.text = @"29111990m";
	[self loginButtonWasPressed:nil];
}

- (void)forgetPasswordButtonWasPressed:(id)sender {
    
}

- (void)loginButtonWasPressed:(id)sender {
	
	if (self.loginTextField.text.length < 3 || self.passwordTextField.text.length == 0) {
		return;
	}
	
	NSString *phoneNumberWithoutPrefix = [self.loginTextField.text substringFromIndex:2];
    NSString *loginString = phoneNumberWithoutPrefix;
    NSString *passwordString = self.passwordTextField.text;
	
	QLBooleanCompletion localAuthCompletion = ^(BOOL success, NSError *error) {
		if (success) {
			[self loginCompleted];
		} else {
			[self showErrorAlertWithError:error];
		}
	};
	
	QLBankAuthCompletion bankAuthLoginCompletion = ^(BOOL success, NSError *error) {
		if (success) {
			QLAuthorizationRequestConfiguration *configuration = [[QLAuthorizationRequestConfiguration alloc]
																  initWithLogin:phoneNumberWithoutPrefix
																  password:self.passwordTextField.text];
			
			[self.authorizationService authorizeWithConfiguration:configuration
													   completion:localAuthCompletion];
		} else {
            [self showErrorAlertWithError:(NSError *)error];
		}
	};
	
    [self.animator startAnimation];
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
    
    [self.animator stopAnimation];
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

- (void)showErrorAlertWithError:(NSError *)error {
    NSInteger errorCode = error.code;
    NSString *messageString = [NSString stringWithFormat:@"%@ - %d", @"Неверная пара логин/пароль", (int)errorCode];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Не удалось авторизоваться"
                                                                             message:messageString
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
