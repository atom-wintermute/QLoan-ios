//
//  QLFacebookLoginViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankAuthService;

@interface QLFacebookLoginViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;
@property (nonatomic, weak) IBOutlet UIButton *continueButton;

@property (nonatomic, strong) id<QLBankAuthService> bankAuthService;

- (IBAction)continueWithCurrentUser:(id)sender;

- (IBAction)cancelButtonWasPressed:(id)sender;

@end
