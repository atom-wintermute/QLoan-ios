//
//  QLOrderDetailCellObjectFactory.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOrderDetailCellObjectFactory.h"
#import "QLOrderInfo.h"
#import "QLProfileDataCellObject.h"
#import "QLRepaymentTypeParser.h"
#import "EntityConstants.h"

@implementation QLOrderDetailCellObjectFactory

- (NSArray *)detailCellObjectsFromOrderInfo:(QLOrderInfo *)orderInfo {
	NSString *percentage = [NSString stringWithFormat:@"%d%% годовых", (int)orderInfo.order.percentage];
	QLProfileDataCellObject *percentageObject = [self cellObjectWithTitle:@"Ставка"
																	value:percentage];
	NSString *penalty = [NSString stringWithFormat:@"%d%% в год", (int)orderInfo.order.penalty];
	QLProfileDataCellObject *penaltyObject = [self cellObjectWithTitle:@"Неустойка"
																 value:penalty];
	NSString *period = [NSString stringWithFormat:@"%d д.", (int)orderInfo.order.loanMaturityPeriod];
	QLProfileDataCellObject *periodObject = [self cellObjectWithTitle:@"Срок займа"
																value:period];
	NSString *amount = [NSString stringWithFormat:@"%d ₽", (int)orderInfo.order.loanAmount];
	QLProfileDataCellObject *amountObject = [self cellObjectWithTitle:@"Сумма займа"
																value:amount];
	NSString *repaymentType;
	switch (orderInfo.order.repaymentType) {
		case QLOnce:
			repaymentType = @"По окончании срока займа";
		case QLMonthly:
			repaymentType = @"Ежемесячно в равных долях";
	}
	QLProfileDataCellObject *repaymentObject = [self cellObjectWithTitle:@"Порядок погашения"
																value:repaymentType];
	NSString *total = [NSString stringWithFormat:@"%ld ₽", (long)[self calculateEarnings:orderInfo.order]];
	QLProfileDataCellObject *totalObject = [self cellObjectWithTitle:@"Сумма займа"
																value:total];
	
	return @[percentageObject,
			 penaltyObject,
			 periodObject,
			 amountObject,
			 repaymentObject,
			 totalObject];
}

- (QLProfileDataCellObject *)cellObjectWithTitle:(NSString *)title
										   value:(NSString *)value {
	QLProfileDataCellObject *cellObject = [QLProfileDataCellObject new];
	cellObject.nameString = title;
	cellObject.valueString = value;
	
	return cellObject;
}

- (NSInteger)calculateEarnings:(QLBorrowerOrder *)order {
	CGFloat percentage = (order.percentage) / 100;
	CGFloat amount = order.loanAmount;
	CGFloat maturityPeriod = order.loanMaturityPeriod;
	
	return (percentage * maturityPeriod / 365) * amount;
}

@end
