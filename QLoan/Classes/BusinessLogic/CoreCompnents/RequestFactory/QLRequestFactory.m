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

@implementation QLRequestFactory

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
	[self configureHeadersWithToken];
	return [self.requestSerializer requestWithMethod:QLGetRequestMethodKey
										   URLString:[self urlStringWithPath:path]
										  parameters:parameters
											   error:NULL];
}

- (NSURLRequest *)postRequestWithPath:(NSString *)path
						   parameters:(NSDictionary *)parameters
{
	[self configureHeadersWithToken];
	return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
										   URLString:[self urlStringWithPath:path]
										  parameters:parameters
											   error:NULL];
}

- (NSURLRequest *)putRequestWithPath:(NSString *)path
						  parameters:(NSDictionary *)parameters
{
	[self configureHeadersWithToken];
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

- (BOOL)configureHeadersWithToken {
	NSString *token = [self.keychainStorage tokenForCurrentUser];
	
	if (!token) {
		return NO;
	}
	
	[self.requestSerializer setValue:token forHTTPHeaderField:QLHeaderTokenKey];
	return YES;
}

@end
