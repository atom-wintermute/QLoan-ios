//
//  QLKeychainStorage.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLKeychainStorage.h"
#import <SAMKeychain.h>

static NSString *const QLLocalAuthorizationLoginKey = @"local.authorization.login";
static NSString *const QLLocalAuthorizationPasswordKey = @"local.authorization.password";
static NSString *const QLLocalAuthorizationUidKey = @"local.authorization.uid";
static NSString *const QLLocalAuthorizationAccessTokenKey = @"local.authorization.accessToken";
static NSString *const QLLocalAuthorizationClientKey = @"local.authorization.client";
static NSString *const QLSessionServiceName = @"keychainservice.session";
static NSString *const QLSessionString = @"session";

@implementation QLKeychainStorage

- (QLAuthorizationRequestConfiguration *)authorizationConfigurationForCurrentUser {
	QLAuthorizationRequestConfiguration *configuration = [QLAuthorizationRequestConfiguration new];
	configuration.login = @"myLogin";//[self loadObjectForKey:QLLocalAuthorizationLoginKey];
	configuration.password = @"myPassword";//[self loadObjectForKey:QLLocalAuthorizationPasswordKey];
	
	return configuration;
}

- (void)setAuthorizationConfiguration:(QLAuthorizationRequestConfiguration *)configuration {
	[self storeObject:configuration.login
			   forKey:QLLocalAuthorizationLoginKey];
	[self storeObject:configuration.password
			   forKey:QLLocalAuthorizationPasswordKey];
}

- (QLSessionCredentials *)credentialsForCurrentUser {
	QLSessionCredentials *credentials = [QLSessionCredentials new];
	credentials.accessToken = [self loadObjectForKey:QLLocalAuthorizationAccessTokenKey];
	credentials.uid = [self loadObjectForKey:QLLocalAuthorizationUidKey];
	credentials.client = [self loadObjectForKey:QLLocalAuthorizationClientKey];
	
	return credentials;
}

- (void)setCredentialsForCurrentUser:(QLSessionCredentials *)credentials {
	[self storeObject:credentials.accessToken
			   forKey:QLLocalAuthorizationAccessTokenKey];
	[self storeObject:credentials.uid
			   forKey:QLLocalAuthorizationUidKey];
	[self storeObject:credentials.client
			   forKey:QLLocalAuthorizationClientKey];
}

#pragma mark - QLStorage

- (void)storeObject:(id)object
             forKey:(NSString *)key {
    [SAMKeychain setPassword:object
                  forService:[self sessionServiceName]
                     account:key];
}

- (id)loadObjectForKey:(NSString *)key {
    return [SAMKeychain passwordForService:[self sessionServiceName]
                                   account:key];
}

- (void)removeObjectForKey:(NSString *)key {
    [SAMKeychain deletePasswordForService:[self sessionServiceName]
                                  account:key];
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
