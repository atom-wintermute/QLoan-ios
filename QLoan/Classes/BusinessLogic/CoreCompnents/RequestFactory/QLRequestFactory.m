//
//  QLRequestFactory.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRequestFactory.h"
#import "QLKeychainStorage.h"
#import "QLSortMethodParser.h"
#import "QLRegistrationRequestConfiguration.h"
#import "QLAuthorizationRequestConfiguration.h"

@implementation QLRequestFactory

- (NSURLRequest *)requestForRegistrationWithConfiguration:(QLRegistrationRequestConfiguration *)configuration {
	NSDictionary *dictionary = @{
								 @"login" : configuration.login,
								 @"password" : configuration.password,
								 @"password_confirmation" : configuration.password,
								 @"first_name" : configuration.firstName,
								 @"last_name" : configuration.lastName,
								 @"parent_name" : configuration.parentName
								 };
	return [self postRequestWithPath:@"auth/"
						  parameters:dictionary];
}

- (NSURLRequest *)requestForAuthorizationWithConfiguration:(QLAuthorizationRequestConfiguration *)configuration {
	NSDictionary *dictionary = @{
								 @"login" : configuration.login,
								 @"password" : configuration.password
								 };
	return [self postRequestWithPath:@"auth/sign_in/"
						  parameters:dictionary];
}

- (NSURLRequest *)requestForBorrowerOrdersWithPage:(NSUInteger)page
										sortMethod:(QLSortMethod)sortMethod
										 ascending:(BOOL)ascending {
	NSMutableDictionary *dictionary = [@{ @"pageNumber": @(page) } mutableCopy];
	NSString *sortMethodDescription = [QLSortMethodParser descriptionFromSortMethod:sortMethod];
	
	if (sortMethodDescription != nil) {
		NSString *sortOrdering = [QLSortMethodParser descriptionFromSortOrdering:ascending];
		[dictionary setValue:sortOrdering forKey:sortMethodDescription];
	}
	
	return [self getRequestWithPath:@"getBorrwersOrders/"
						 parameters:[dictionary copy]];
}

- (NSURLRequest *)requestForBorrowerOrderWithId:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self getRequestWithPath:@"getBorrowersOrder"
						 parameters:dictionary];
}

#pragma mark - Вспомогательные методы

- (NSURLRequest *)getRequestWithPath:(NSString *)path
						  parameters:(NSDictionary *)parameters
{
	[self configureHeadersWithCredentials];
	return [self.requestSerializer requestWithMethod:QLGetRequestMethodKey
										   URLString:[self urlStringWithPath:path]
										  parameters:parameters
											   error:NULL];
}

- (NSURLRequest *)postRequestWithPath:(NSString *)path
						   parameters:(NSDictionary *)parameters
{
	[self configureHeadersWithCredentials];
	return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
										   URLString:[self urlStringWithPath:path]
										  parameters:parameters
											   error:NULL];
}

- (NSURLRequest *)putRequestWithPath:(NSString *)path
						  parameters:(NSDictionary *)parameters
{
	[self configureHeadersWithCredentials];
	return [self.requestSerializer requestWithMethod:QLPutRequestMethodKey
										   URLString:[self urlStringWithPath:path]
										  parameters:parameters
											   error:NULL];
}

- (NSString *)urlStringWithPath:(NSString *)path
{
	NSURL *baseUrl = [NSURL URLWithString:QLLocalServerBasePath];
	return [[NSURL URLWithString:path relativeToURL:baseUrl] absoluteString];
}

- (void)configureHeadersWithCredentials {
	QLSessionCredentials *credentials = [self.keychainStorage credentialsForCurrentUser];
	
	[self.requestSerializer setValue:credentials.accessToken forHTTPHeaderField:QLHeaderTokenKey];
	[self.requestSerializer setValue:credentials.uid forHTTPHeaderField:QLHeaderUidKey];
	[self.requestSerializer setValue:credentials.client forHTTPHeaderField:QLHeaderClientKey];
}

@end
