//
//  CreateOrderViewController.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLCreateOrderViewController.h"

@implementation QLCreateOrderViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view layoutIfNeeded];
	
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.view layoutIfNeeded];
	
	[self.createOrderButton addGradient];
	[self.view layoutIfNeeded];
}

- (IBAction)createLoan:(UIButton *)sender {
	
}


@end
