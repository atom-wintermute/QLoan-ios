//
//  QLCreateLenderOrderViewController.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLCreateLenderOrderViewController.h"
#import "QLLenderOrderService.h"
#import "EntityConstants.h"
#import "QLBorrowerOrder.h"

@interface QLCreateLenderOrderViewController ()

@property (nonatomic, assign) BOOL requestIsBeingCreated;

@end

@implementation QLCreateLenderOrderViewController

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self configureTextfieldDelegate];
	
	self.title = @"Выдать займ";
	
	self.monthlyCheckbox.hidden = NO;
	self.onceCheckbox.hidden = YES;
	self.yourEarningsLabel.text = @"";
	self.requestIsBeingCreated = NO;
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(textFieldChanged:)
												 name:UITextFieldTextDidChangeNotification
											   object:self.loanAmountTextfield];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(textFieldChanged:)
												 name:UITextFieldTextDidChangeNotification
											   object:self.loanPeriodTextfield];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(textFieldChanged:)
												 name:UITextFieldTextDidChangeNotification
											   object:self.percentageTextfield];
}

- (void)textFieldChanged:(NSNotification *)notification {
	if ([self allFieldsCompleted]) {
		self.yourEarningsLabel.text = [NSString stringWithFormat:@"%li ₽", (long)[self calculateEarnings]];
	} else {
		self.yourEarningsLabel.text = @"";
	}
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
	if (![self allFieldsCompleted]) {
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
	
	[self.lenderOrderService addLenderOrder:order
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
	BOOL valid = NO;
	
	if (textField == self.loanAmountTextfield) {
		valid = [self validateText:string
						 maxChars:8
					  inTextfield:textField];
	}
	if (textField == self.loanPeriodTextfield) {
		valid = [self validateText:string
						 maxChars:4
					  inTextfield:textField];
	}
	if (textField == self.percentageTextfield) {
		valid = [self validateText:string
						 maxChars:2
					  inTextfield:textField];
	}
	if (textField == self.loanPenaltyTextfield) {
		valid = [self validateText:string
						 maxChars:2
					  inTextfield:textField];
	}
	
	return valid;
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

- (BOOL)allFieldsCompleted {
	if (self.loanAmountTextfield.text.length == 0 ||
		self.loanPeriodTextfield.text.length == 0 ||
		self.percentageTextfield.text.length == 0) {
		return NO;
	}
	
	return YES;
}

- (NSInteger)calculateEarnings {
	if (![self allFieldsCompleted]) {
		return 0;
	}
	CGFloat percentage = ([self.percentageTextfield.text integerValue] - QLBankComission) / 100;
	CGFloat amount = [self.loanAmountTextfield.text integerValue];
	CGFloat maturityPeriod = [self.loanPeriodTextfield.text integerValue];
	
	return (percentage * maturityPeriod / 365) * amount;
}

@end
