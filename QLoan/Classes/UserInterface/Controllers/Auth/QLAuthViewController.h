//
//  QLAuthViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankAuthService;
@protocol QLBankCardService;
@protocol QLStorage;

@class QLAuthorizationService;

/**
 Экран авторизации/регистрации пользователя
 */
@interface QLAuthViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *loginTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topConstraint;

@property (nonatomic, strong) id<QLBankAuthService> bankAuthService;
@property (nonatomic, strong) id<QLBankCardService> bankCardService;
@property (nonatomic, strong) id<QLStorage> storage;

@property (nonatomic, strong) QLAuthorizationService *authorizationService;

- (IBAction)fastLoginButtonWasPressed:(id)sender;

- (IBAction)forgetPasswordButtonWasPressed:(id)sender;

- (IBAction)loginButtonWasPressed:(id)sender;

- (IBAction)registerButtonWasPressed:(id)sender;

- (IBAction)dataWasChanged:(id)sender;

@end
