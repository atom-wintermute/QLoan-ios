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
#import "QLBorrowerOrder.h"

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

#pragma mark - Мои заявки

- (NSURLRequest *)requestForMyBorrowerOrdersWithPage:(NSUInteger)page
										  sortMethod:(QLSortMethod)sortMethod
										   ascending:(BOOL)ascending {
	NSMutableDictionary *dictionary = [@{ @"page_number": @(page) } mutableCopy];
	NSString *sortMethodDescription = [QLSortMethodParser descriptionFromSortMethod:sortMethod];
	
	if (sortMethodDescription != nil) {
		NSString *sortOrdering = [QLSortMethodParser descriptionFromSortOrdering:ascending];
		[dictionary setValue:sortOrdering forKey:sortMethodDescription];
	}
	
	return [self getRequestWithPath:@"getMyBorrwersOrders/"
						 parameters:[dictionary copy]];
}

- (NSURLRequest *)requestForMyLenderOrdersWithPage:(NSUInteger)page
										sortMethod:(QLSortMethod)sortMethod
										 ascending:(BOOL)ascending {
	NSMutableDictionary *dictionary = [@{ @"page_number": @(page) } mutableCopy];
	NSString *sortMethodDescription = [QLSortMethodParser descriptionFromSortMethod:sortMethod];
	
	if (sortMethodDescription != nil) {
		NSString *sortOrdering = [QLSortMethodParser descriptionFromSortOrdering:ascending];
		[dictionary setValue:sortOrdering forKey:sortMethodDescription];
	}
	
	return [self getRequestWithPath:@"getMyLendersOrders/"
						 parameters:[dictionary copy]];
}

#pragma mark - Нотификации

- (NSURLRequest *)requestForMyNotificationsWithPage:(NSUInteger)page {
	NSDictionary *dictionary = @{ @"page_number": @(page) };
	return [self getRequestWithPath:@"get_my_notifications/"
						 parameters:dictionary];
}

- (NSURLRequest *)requestForMyNotificationWithId:(NSUInteger)notificationId {
	NSDictionary *dictionary = @{ @"id": @(notificationId) };
	return [self getRequestWithPath:@"get_my_notification/"
						 parameters:dictionary];
}

#pragma mark - Платежи

- (NSURLRequest *)requestForMyPaymentsWithOrderId:(NSUInteger)orderId {
	NSDictionary *dictionary = @{ @"id": @(orderId) };
	return [self getRequestWithPath:@"get_my_payments/"
						 parameters:dictionary];
}

#pragma mark - Информация о пользователе

- (NSURLRequest *)requestForCurrentUser {
	return [self getRequestWithPath:@"current_user/"
						 parameters:nil];
}

- (NSURLRequest *)requestForUserWithId:(NSUInteger)userId {
	NSString* stringId = [NSString stringWithFormat:@"users/%d", (int)userId];
	return [self getRequestWithPath:stringId
						 parameters:nil];
}

- (NSURLRequest *)requestForUsersWithIds:(NSArray <NSNumber *> *)ids {

	NSMutableString *mutableString = [@"users?" mutableCopy];
	for (NSUInteger index = 0; index < ids.count; index++) {
		NSNumber *numberId = ids[index];
		NSString* stringId = [NSString stringWithFormat:@"users_ids[]=%d", (int)[numberId integerValue]];
		[mutableString appendString:stringId];
		if (index != ids.count - 1) {
			[mutableString appendString:@"&"];
		}
	}
	
	return [self getRequestWithPath:[mutableString copy]
						 parameters:nil];
}

#pragma mark - Заявки Заемщика

- (NSURLRequest *)requestForBorrowerOrdersWithPage:(NSUInteger)page
										sortMethod:(QLSortMethod)sortMethod
										 ascending:(BOOL)ascending {
	NSMutableDictionary *dictionary = [@{ @"page_number": @(page) } mutableCopy];
	NSString *sortMethodDescription = [QLSortMethodParser descriptionFromSortMethod:sortMethod];
	
	if (sortMethodDescription != nil) {
		NSString *sortOrdering = [QLSortMethodParser descriptionFromSortOrdering:ascending];
		[dictionary setValue:sortOrdering forKey:sortMethodDescription];
	}
	
	return [self getRequestWithPath:@"borrower_orders"
						 parameters:nil];//[dictionary copy]];
}

- (NSURLRequest *)requestForBorrowerOrderWithId:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self getRequestWithPath:@"borrower_orders"
						 parameters:dictionary];
}

- (NSURLRequest *)requestForAddingBorrowerOrder:(NSDictionary *)orderParameters {
	return [self postRequestWithPath:@"borrower_orders"
						  parameters:orderParameters];
}

#pragma mark - Заявки Займодавца

- (NSURLRequest *)requestForLenderOrdersWithPage:(NSUInteger)page
									  sortMethod:(QLSortMethod)sortMethod
									   ascending:(BOOL)ascending {
	NSMutableDictionary *dictionary = [@{ @"page_number": @(page) } mutableCopy];
	NSString *sortMethodDescription = [QLSortMethodParser descriptionFromSortMethod:sortMethod];
	
	if (sortMethodDescription != nil) {
		NSString *sortOrdering = [QLSortMethodParser descriptionFromSortOrdering:ascending];
		[dictionary setValue:sortOrdering forKey:sortMethodDescription];
	}
	
	return [self getRequestWithPath:@"lender_orders"
						 parameters:[dictionary copy]];
}

- (NSURLRequest *)requestForLenderOrderWithId:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self getRequestWithPath:@"lender_orders"
						 parameters:dictionary];
}

- (NSURLRequest *)requestForAddingLenderOrder:(NSDictionary *)orderParameters {
	return [self postRequestWithPath:@"lender_orders"
						  parameters:orderParameters];
}

#pragma mark - Направление запросов

- (NSURLRequest *)requestForLoanReceipt:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self putRequestWithPath:@"sendLoanReceiveRequest/"
						 parameters:dictionary];
}

- (NSURLRequest *)requestForLoanProvision:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self putRequestWithPath:@"sendLoanProvideRequest/"
						 parameters:dictionary];
}

- (NSURLRequest *)provideLoanRequest:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self putRequestWithPath:@"provideLoan/"
						 parameters:dictionary];
}

- (NSURLRequest *)requestForLoanConfirmation:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self postRequestWithPath:@"confirmLoan/"
						  parameters:dictionary];
}

- (NSURLRequest *)requestForOrderDeactivation:(NSInteger)orderId {
	NSDictionary *dictionary = @{ @"id" : @(orderId) };
	return [self postRequestWithPath:@"deactivateOrder/"
						  parameters:dictionary];
}

- (NSURLRequest *)requestForPaymentCompletion:(NSDictionary *)orderParameters {
	return [self postRequestWithPath:@"paymentCompleted/"
						  parameters:orderParameters];
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
