//
//  QLSerializer.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLSerializer.h"
#import "QLMappingProvider.h"
#import "QLDateFormatter.h"
#import "QLBorrowerOrder.h"
#import "QLLenderOrder.h"
#import "QLRepaymentTypeParser.h"

#import <EKObjectMapping.h>

#import "QLPaymentCompletedRequestConfiguration.h"

@implementation QLSerializer

- (NSDictionary *)dictionaryFromBorrowerOrder:(QLBorrowerOrder *)borrowerOrder {
	return @{
			 @"loan_maturity_period" : @(borrowerOrder.loanMaturityPeriod),
			 @"loan_amount" : @(borrowerOrder.loanAmount),
			 @"perecentage" : @(borrowerOrder.perecentage),
			 @"penalty" : @(borrowerOrder.penalty),
			 @"repayment_type" : [QLRepaymentTypeParser descriptionFromRepaymentType:borrowerOrder.repaymentType],
			 @"status": @"active"
			 };
}

- (NSDictionary *)dictionaryFromLenderOrder:(QLLenderOrder *)lenderOrder {
	return @{
			 @"loan_maturity_period" : @(lenderOrder.loanMaturityPeriod),
			 @"loan_amount" : @(lenderOrder.loanAmount),
			 @"perecentage" : @(lenderOrder.perecentage),
			 @"penalty" : @(lenderOrder.penalty),
			 @"repayment_type" : [QLRepaymentTypeParser descriptionFromRepaymentType:lenderOrder.repaymentType],
			 @"status": @"active"
			 };
}

- (NSDictionary *)dictionaryFromPaymentCompleted:(QLPaymentCompletedRequestConfiguration *)configuration {
	return @{
			 @"id" : [NSNumber numberWithLong:configuration.orderId],
			 @"amount" : [NSNumber numberWithFloat:configuration.amount],
			 @"date" : [self.dateFormatter stringFromDate:configuration.date]
			};
}

@end
