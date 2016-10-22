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
		default:
			return nil;
	}
}

+ (QLBorrowerOrderStatus)statusFromDescription:(NSString *)description {
	return QLBorrowerOrderStatusActive;
}

@end
