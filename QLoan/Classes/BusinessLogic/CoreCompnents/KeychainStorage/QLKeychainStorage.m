//
//  QLKeychainStorage.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLKeychainStorage.h"
#import <SAMKeychain.h>

static NSString *const QLSessionServiceName = @"keychainservice.session";
static NSString *const QLSessionString = @"session";

@implementation QLKeychainStorage

- (NSString *)tokenForCurrentUser {
	NSString *sessionServiceName = [self sessionServiceName];
	NSString *sessionString = [self sessionString];
	
	NSString *token = [SAMKeychain passwordForService:sessionServiceName
											  account:sessionString];
	return token;
}

- (void)setTokenForCurrentUser:(NSString *)token {
	NSString *sessionServiceName = [self sessionServiceName];
	NSString *sessionString = [self sessionString];
	
	[SAMKeychain setPassword:token
				  forService:sessionServiceName
					 account:sessionString];
}

#pragma mark - Вспомогательные методы

- (NSString *)sessionServiceName {
	return [NSString stringWithFormat:@"%@.%@", [self bundleIdentifier], QLSessionServiceName];
}

- (NSString *)sessionString {
	return [NSString stringWithFormat:@"%@.%@", [self bundleIdentifier], QLSessionString];
}

- (NSString *)bundleIdentifier {
	return [[NSBundle mainBundle] bundleIdentifier];
}

@end
