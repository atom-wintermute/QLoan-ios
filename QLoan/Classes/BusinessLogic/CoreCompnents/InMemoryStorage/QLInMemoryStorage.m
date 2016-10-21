//
//  QLInMemoryStorage.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLInMemoryStorage.h"

static NSString *const QLLocalAuthorizationLoginKey = @"local.authorization.login";
static NSString *const QLLocalAuthorizationPasswordKey = @"local.authorization.password";
static NSString *const QLLocalAuthorizationUidKey = @"local.authorization.uid";
static NSString *const QLLocalAuthorizationAccessTokenKey = @"local.authorization.accessToken";
static NSString *const QLLocalAuthorizationClientKey = @"local.authorization.client";
static NSString *const QLSessionServiceName = @"keychainservice.session";
static NSString *const QLSessionString = @"session";

@implementation QLInMemoryStorage

#pragma mark - Свойства

- (NSDictionary *)storageDictionary {
    if (_storageDictionary == nil) {
        _storageDictionary = [NSDictionary new];
    }
    return _storageDictionary;
}

#pragma mark - QLStorage

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

- (void)storeObject:(id)object forKey:(NSString *)key {
    NSMutableDictionary *tempDictionary = [self.storageDictionary mutableCopy];
    [tempDictionary setValue:object forKey:key];
    self.storageDictionary = tempDictionary;
}

- (id)loadObjectForKey:(NSString *)key {
    return self.storageDictionary[key];
}

- (void)loadObjectForKey:(NSString *)key withCompletion:(void (^)(id))completion {
    id object = [self loadObjectForKey:key];
    run_block(completion, object);
}

- (void)removeObjectForKey:(NSString *)key {
    NSMutableDictionary *tempDictionary = [self.storageDictionary mutableCopy];
    [tempDictionary removeObjectForKey:key];
    self.storageDictionary = tempDictionary;
}

@end
