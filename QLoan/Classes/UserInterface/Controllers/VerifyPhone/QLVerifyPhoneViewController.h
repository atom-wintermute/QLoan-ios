//
//  QLVerifyPhoneViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankAuthService;
@protocol QLStorage;

@interface QLVerifyPhoneViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *codeTextField;
@property (nonatomic, weak) IBOutlet UIButton *registerButton;

@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, strong) id<QLBankAuthService> bankAuthService;

- (IBAction)registerButtonWasPressed:(id)sender;

- (IBAction)codeTextFieldValueChanged:(id)sender;

@end
