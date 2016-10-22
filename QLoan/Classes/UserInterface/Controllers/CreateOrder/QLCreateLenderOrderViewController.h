//
//  QLCreateLenderOrderViewController.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "QLUnderlinedTextfield.h"
#import "QLServicesAssembly.h"
#import "UIView+Gradient.h"

@interface QLCreateLenderOrderViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet QLUnderlinedTextfield *loanAmountTextfield;
@property (weak, nonatomic) IBOutlet QLUnderlinedTextfield *percentageTextfield;
@property (weak, nonatomic) IBOutlet QLUnderlinedTextfield *loanPeriodTextfield;
@property (weak, nonatomic) IBOutlet QLUnderlinedTextfield *loanPenaltyTextfield;
@property (weak, nonatomic) IBOutlet UIImageView *monthlyCheckbox;
@property (weak, nonatomic) IBOutlet UIImageView *onceCheckbox;

@property (weak, nonatomic) IBOutlet UIButton *createOrderButton;
@property (strong, nonatomic) QLBorrowerOrderService *borrowerOrderService;


@end
