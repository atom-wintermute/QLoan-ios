//
//  QLMappingProvider.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMappingProvider.h"
#import "QLSessionCredentials.h"

@implementation QLMappingProvider

- (EKObjectMapping *)borrowerOrderMapping {
	return [EKObjectMapping mappingForClass:[QLBorrowerOrder class] withBlock:^(EKObjectMapping *mapping) {
		
		[mapping mapFieldsFromDictionary:@{
										   @"borrowerId": @"borrowerId",
										   @"lenderId" : @"lenderId",
										   @"loanMaturityPeriod" : @"loanMaturityPeriod",
										   @"loanAmount" : @"loanAmount",
										   @"perecentage" : @"perecentage",
										   @"penalty" : @"penalty"
										   }];
	}];
}

- (EKObjectMapping *)authorizationHeaderMapping {
	return [EKObjectMapping mappingForClass:[QLSessionCredentials class] withBlock:^(EKObjectMapping *mapping) {
		
		[mapping mapFieldsFromDictionary:@{
										   @"client": @"client",
										   @"uid" : @"uid",
										   @"access_token" : @"accessToken"
										   }];
	}];
}

@end
