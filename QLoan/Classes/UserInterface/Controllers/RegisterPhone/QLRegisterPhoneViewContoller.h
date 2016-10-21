//
//  QLRegisterPhoneViewContoller.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLRegisterPhoneViewContoller : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *phoneTextField;
@property (nonatomic, weak) IBOutlet UIButton *getCodeButton;

- (IBAction)getCodeButtonPressed:(id)sender;

@end
