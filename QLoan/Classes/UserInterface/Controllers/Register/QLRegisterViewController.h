//
//  QLRegisterViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankAuthService;

/**
 Контроллер регистрации - ввода данных нового пользователя
 */
@interface QLRegisterViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UITextField *repeatPasswordTextField;
@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *firstNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *secondNameTextField;
@property (nonatomic, weak) IBOutlet UIButton *continueButton;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic, strong) id<QLBankAuthService> bankAuthService;

- (IBAction)dataWasChanged:(id)sender;

- (IBAction)continueButtonWasPressed:(id)sender;

@end
