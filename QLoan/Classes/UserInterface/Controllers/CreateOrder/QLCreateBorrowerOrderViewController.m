//
//  CreateOrderViewController.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLCreateBorrowerOrderViewController.h"
#import "QLBorrowerOrderService.h"

@implementation QLCreateBorrowerOrderViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.monthlyCheckbox.hidden = NO;
	self.onceCheckbox.hidden = YES;
}

- (IBAction)createLoan:(UIButton *)sender {
	
}
- (IBAction)monthlyTapped:(UIButton *)sender {
	self.monthlyCheckbox.hidden = NO;
	self.onceCheckbox.hidden = YES;
}
- (IBAction)onceTapped:(id)sender {
	self.monthlyCheckbox.hidden = YES;
	self.onceCheckbox.hidden = NO;
}

@end
