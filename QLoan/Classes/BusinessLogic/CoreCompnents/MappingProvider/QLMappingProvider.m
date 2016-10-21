//
//  QLMappingProvider.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMappingProvider.h"
#import "QLSessionCredentials.h"

#import "QLBorrowerOrder.h"
#import "QLLenderOrder.h"

@implementation QLMappingProvider

- (EKObjectMapping *)borrowerOrderMapping {
	return [EKObjectMapping mappingForClass:[QLBorrowerOrder class] withBlock:^(EKObjectMapping *mapping) {
		
		[mapping mapFieldsFromDictionary:@{
										   @"borrowerId": @"borrowerId",
										   @"lenderId" : @"lenderId",
										   @"loanMaturityPeriod" : @"loanMaturityPeriod",
										   @"loanAmount" : @"loanAmount",
										   @"perecentage" : @"perecentage",
										   @"penalty" : @"penalty",
										   @"repaymentType" : @"repaymentType",
										   @"status": @"status"
										   }];
	}];
}

- (EKObjectMapping *)lenderOrderMapping {
	return [EKObjectMapping mappingForClass:[QLLenderOrder class] withBlock:^(EKObjectMapping *mapping) {
		
		[mapping mapFieldsFromDictionary:@{
										   @"borrowerId": @"borrowerId",
										   @"lenderId" : @"lenderId",
										   @"loanMaturityPeriod" : @"loanMaturityPeriod",
										   @"loanAmount" : @"loanAmount",
										   @"perecentage" : @"perecentage",
										   @"penalty" : @"penalty",
										   @"repaymentType" : @"repaymentType",
										   @"status": @"status"
										   }];
	}];
}

- (EKObjectMapping *)authorizationHeaderMapping {
	return [EKObjectMapping mappingForClass:[QLSessionCredentials class] withBlock:^(EKObjectMapping *mapping) {
		
		[mapping mapFieldsFromDictionary:@{
										   @"client": @"client",
										   @"uid" : @"uid",
										   @"access-token" : @"accessToken"
										   }];
	}];
}

@end
