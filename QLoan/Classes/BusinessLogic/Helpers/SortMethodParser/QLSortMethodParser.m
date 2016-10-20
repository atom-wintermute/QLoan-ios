//
//  QLSortMethodParser.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLSortMethodParser.h"

@implementation QLSortMethodParser

+ (NSString *)descriptionFromSortMethod:(QLSortMethod)sortMethod {
	switch (sortMethod) {
		case QLSortByDate:
			return @"sortByDate";
		case QLSortByRating:
			return @"sortByRating";
		case QLSortByAmount:
			return @"sortByAmount";
		case QLSortByDuration:
			return @"sortByDuration";
		case QLSortByPercentage:
			return @"sortByPercentage";
		default:
			return nil;
	}
}

+ (NSString *)descriptionFromSortOrdering:(BOOL)ascending {
	if (ascending) {
		return @"ASC";
	} else {
		return @"DESC";
	}
}

@end
