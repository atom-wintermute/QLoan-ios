//
//  QLDateFormatter.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLDateFormatter.h"

static NSString *const QLRussianLocaleIdentifier = @"ru_RU";

@interface QLDateFormatter()

@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation QLDateFormatter

- (instancetype)init {
	self = [super init];
	if (self) {
		NSLocale *locale = [NSLocale localeWithLocaleIdentifier:QLRussianLocaleIdentifier];
		_formatter = [NSDateFormatter new];
		_formatter.dateStyle = NSDateFormatterMediumStyle;
		_formatter.timeStyle = NSDateFormatterShortStyle;
		_formatter.locale = locale;
	}
	
	return self;
}

- (NSString *)stringFromDate:(NSDate *)date {
	return [self.formatter stringFromDate:date];
}

- (NSDate *)dateFromString:(NSString *)string {
	return [self.formatter dateFromString:string];
}

@end
