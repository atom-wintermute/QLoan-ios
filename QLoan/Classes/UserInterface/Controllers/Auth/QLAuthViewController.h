//
//  QLAuthViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Экран авторизации/регистрации пользователя
 */
@interface QLAuthViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *loginTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

- (IBAction)forgetPasswordButtonWasPressed:(id)sender;

- (IBAction)loginButtonWasPressed:(id)sender;

- (IBAction)registerButtonWasPressed:(id)sender;

@end
