//
//  QLOrderStatusParser.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOrderStatusParser.h"

@implementation QLOrderStatusParser

+ (NSString *)descriptionFromBorrowerStatus:(QLBorrowerOrderStatus)status {
	switch (status) {
		case QLBorrowerOrderStatusActive:
			return @"active";
		case QLBorrowerOrderStatusRequested:
			return @"requested";
		case QLBorrowerOrderStatusStarted:
			return @"started";
		case QLBorrowerOrderStatusFinished:
			return @"finished";
		default:
			return nil;
	}
}

+ (QLBorrowerOrderStatus)statusFromDescription:(NSString *)description {
	if ([description isEqualToString:@"active"]) {
		return QLBorrowerOrderStatusActive;
	}
	if ([description isEqualToString:@"requested"]) {
		return QLBorrowerOrderStatusRequested;
	}
	if ([description isEqualToString:@"started"]) {
		return QLBorrowerOrderStatusStarted;
	}
	if ([description isEqualToString:@"finished"]) {
		return QLBorrowerOrderStatusFinished;
	}
	return QLBorrowerOrderStatusActive;
}

@end
