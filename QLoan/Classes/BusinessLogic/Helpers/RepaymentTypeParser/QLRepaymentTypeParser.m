//
//  QLRepaymentTypeParser.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRepaymentTypeParser.h"

@implementation QLRepaymentTypeParser

+ (NSString *)descriptionFromRepaymentType:(QLRepaymentType)repaymentType {
	switch (repaymentType) {
		case QLOnce:
			return @"single_time";
		case QLMonthly:
			return @"monthly";
		default:
			return nil;
	}
}

+ (QLRepaymentType)repaymentTypeFromDescription:(NSString *)description {
	return QLMonthly;
}

@end
