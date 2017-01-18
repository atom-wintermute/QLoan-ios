//
//  NSString+Random.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length
{
	NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
	
	for (int i = 0; i < length; i++) {
		[randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
	}
	
	return randomString;
}

@end
