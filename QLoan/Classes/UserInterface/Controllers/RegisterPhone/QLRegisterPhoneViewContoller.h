//
//  QLRegisterPhoneViewContoller.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankAuthService;
@protocol QLStorage;

// Контроллер экрана ввода телефонного номера для регистрации
@interface QLRegisterPhoneViewContoller : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *phoneTextField;
@property (nonatomic, weak) IBOutlet UIButton *getCodeButton;

@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic, strong) id<QLBankAuthService> bankAuthService;

- (IBAction)getCodeButtonPressed:(id)sender;

- (IBAction)phoneTextFieldValueChanged:(id)sender;

@end
