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

#import <EKObjectMapping.h>

#import "QLPaymentCompletedRequestConfiguration.h"

@implementation QLSerializer

- (NSDictionary *)dictionaryFromBorrowerOrder:(QLBorrowerOrder *)borrowerOrder {
	return [EKSerializer serializeObject:borrowerOrder
							 withMapping:[self.mappingProvider borrowerOrderMapping]];
}

- (NSDictionary *)dictionaryFromLenderOrder:(QLLenderOrder *)lenderOrder {
	return [EKSerializer serializeObject:lenderOrder
							 withMapping:[self.mappingProvider lenderOrderMapping]];
}

- (NSDictionary *)dictionaryFromPaymentCompleted:(QLPaymentCompletedRequestConfiguration *)configuration {
	return @{
			 @"id" : [NSNumber numberWithLong:configuration.orderId],
			 @"amount" : [NSNumber numberWithFloat:configuration.amount],
			 @"date" : [self.dateFormatter stringFromDate:configuration.date]
			};
}

@end
