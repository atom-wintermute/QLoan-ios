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

- (NSArray<QLBorrowerOrder *> *)mapBorrowerOrdersFromResponseObject:(id)responseObject {
	
	if ([responseObject isKindOfClass:[NSDictionary class]]) {
		NSDictionary *responseDictionary = responseObject;
		
		if ([responseDictionary[@"orders"] isKindOfClass:[NSArray class]]) {
			NSArray *objects = responseDictionary[@"orders"];
			NSMutableArray *mappedArray = [NSMutableArray array];
		
			[objects enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
				QLBorrowerOrder *order = [self mapBorrowerOrderFromResponseObject:object];
				if (order != nil) {
					[mappedArray addObject:order];
				}
			}];
			
			return [mappedArray copy];
		}
	}
	return nil;
}

- (QLSessionCredentials *)mapSessionCredentialsFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider authorizationHeaderMapping];
	QLSessionCredentials *credentials = [EKMapper objectFromExternalRepresentation:responseObject
																	   withMapping:mapping];
	
	return credentials;
}

@end
