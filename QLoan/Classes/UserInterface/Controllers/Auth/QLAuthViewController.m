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

static NSString * const QLAuthRegisterSegue = @"registerSegue";

@implementation QLAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureAppearance];
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
    
    [self.bankAuthService loginWithLogin:loginString
                                password:passwordString
                              completion:^(BOOL success, NSError *error) {
                                  if (success) {
                                      // сразу обновляем данные для пользователя
                                      [self.bankAuthService updateCurrentUserDataWithCompletion:nil];
                                      [self.bankCardService updateBankCardsWithCompletion:nil];
                                      [self.presentingViewController dismissViewControllerAnimated:YES
                                                                                        completion:nil];
                                  } else {
                                      [self showErrorAlert];
                                  }
                              }];
}

- (void)registerButtonWasPressed:(id)sender {
    [self performSegueWithIdentifier:QLAuthRegisterSegue
                              sender:self];
}

#pragma mark - Приватные методы

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
    
    [self.loginButton addGradient];
}

@end
