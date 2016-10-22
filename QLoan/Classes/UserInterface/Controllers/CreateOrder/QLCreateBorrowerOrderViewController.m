//
//  CreateOrderViewController.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLCreateBorrowerOrderViewController.h"
#import "QLBorrowerOrderService.h"

#import "QLBorrowerOrder.h"

@interface QLCreateBorrowerOrderViewController ()

@property (nonatomic, assign) BOOL requestIsBeingCreated;

@end

@implementation QLCreateBorrowerOrderViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self configureTextfieldDelegate];
	
	self.title = @"Получить займ";
	
	self.monthlyCheckbox.hidden = NO;
	self.onceCheckbox.hidden = YES;
	
	self.requestIsBeingCreated = NO;
	[self.view layoutIfNeeded];
}

- (IBAction)createLoan:(UIButton *)sender {
	if (self.requestIsBeingCreated) {
		return;
	}
	
	[self createOrder];
	self.requestIsBeingCreated = YES;
}

- (IBAction)monthlyTapped:(UIButton *)sender {
	self.monthlyCheckbox.hidden = NO;
	self.onceCheckbox.hidden = YES;
}

- (IBAction)onceTapped:(id)sender {
	self.monthlyCheckbox.hidden = YES;
	self.onceCheckbox.hidden = NO;
}

#pragma mark - Создание заявки

- (void)createOrder {
	if (self.loanAmountTextfield.text.length == 0 ||
		self.loanPeriodTextfield.text.length == 0 ||
		self.loanPenaltyTextfield.text.length == 0 ||
		self.percentageTextfield.text.length == 0) {
		return;
	}
	
	QLBorrowerOrder *order = [QLBorrowerOrder new];
	order.loanAmount = [self.loanAmountTextfield.text integerValue];
	order.percentage = [self.percentageTextfield.text integerValue];
	order.penalty = [self.loanPenaltyTextfield.text integerValue];
	order.loanMaturityPeriod = [self.loanPeriodTextfield.text integerValue];
	if (self.monthlyCheckbox.hidden) {
		order.repaymentType = QLMonthly;
	} else {
		order.repaymentType = QLOnce;
	}
	
	QLBooleanCompletion completion = ^(BOOL success, NSError *error) {
		self.requestIsBeingCreated = NO;
	};
	
	[self.borrowerOrderService addBorrowerOrder:order
									 completion:completion];
}

#pragma mark - Делегаты для текстфилда

- (void)configureTextfieldDelegate {
	self.loanAmountTextfield.delegate = self;
	self.loanPeriodTextfield.delegate = self;
	self.loanPenaltyTextfield.delegate = self;
	self.percentageTextfield.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if (textField == self.loanAmountTextfield) {
		return [self validateText:string
						 maxChars:8
					  inTextfield:textField];
	}
	if (textField == self.loanPeriodTextfield) {
		return [self validateText:string
						 maxChars:4
					  inTextfield:textField];
	}
	if (textField == self.percentageTextfield) {
		return [self validateText:string
						 maxChars:2
					  inTextfield:textField];
	}
	if (textField == self.loanPenaltyTextfield) {
		return [self validateText:string
						 maxChars:2
					  inTextfield:textField];
	}
	
	return YES;
}

- (BOOL)validateText:(NSString *)text
			maxChars:(NSUInteger)max
		 inTextfield:(UITextField *)textfield {
	if (text.length > 0)
	{
		if (textfield.text.length >= max) {
			return NO;
		}
		NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
		NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:text];
		
		BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
		return stringIsValid;
	}
	
	return YES;
}

@end
