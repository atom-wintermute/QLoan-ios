//
//  QLMapper.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMapper.h"

@implementation QLMapper

- (QLBorrowerOrder *)mapBorrowerOrderFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider borrowerOrderMapping];
	QLBorrowerOrder *order = [EKMapper objectFromExternalRepresentation:responseObject
															withMapping:mapping];
	
	return order;
}

- (QLSessionCredentials *)mapSessionCredentialsFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider authorizationHeaderMapping];
	QLSessionCredentials *credentials = [EKMapper objectFromExternalRepresentation:responseObject
																	   withMapping:mapping];
	
	return credentials;
}

@end
