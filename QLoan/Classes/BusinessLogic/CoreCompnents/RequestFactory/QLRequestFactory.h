//
//  QLRequestFactory.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperation.h>

#import "ServicesConstants.h"
#import "EntityConstants.h"

@class QLKeychainStorage;
@class QLRegistrationRequestConfiguration;
@class QLAuthorizationRequestConfiguration;

@interface QLRequestFactory : NSObject

@property (nonatomic, strong) AFHTTPRequestSerializer *requestSerializer;
@property (nonatomic, strong) QLKeychainStorage *keychainStorage;

- (NSURLRequest *)requestForRegistrationWithConfiguration:(QLRegistrationRequestConfiguration *)configuration;

- (NSURLRequest *)requestForAuthorizationWithConfiguration:(QLAuthorizationRequestConfiguration *)configuration;

#pragma mark - Мои заявки

- (NSURLRequest *)requestForMyBorrowerOrdersWithPage:(NSUInteger)page
										  sortMethod:(QLSortMethod)sortMethod
										   ascending:(BOOL)ascending;

- (NSURLRequest *)requestForMyLenderOrdersWithPage:(NSUInteger)page
										sortMethod:(QLSortMethod)sortMethod
										 ascending:(BOOL)ascending;

#pragma mark - Нотификации

- (NSURLRequest *)requestForMyNotificationsWithPage:(NSUInteger)page;

- (NSURLRequest *)requestForMyNotificationWithId:(NSUInteger)notificationId;

#pragma mark - Платежи

- (NSURLRequest *)requestForMyPaymentsWithOrderId:(NSUInteger)orderId;

#pragma mark - Заявки заемщика

- (NSURLRequest *)requestForBorrowerOrdersWithPage:(NSUInteger)page
										sortMethod:(QLSortMethod)sortMethod
										 ascending:(BOOL)ascending;

- (NSURLRequest *)requestForBorrowerOrderWithId:(NSInteger)orderId;

- (NSURLRequest *)requestForAddingBorrowerOrder:(NSDictionary *)orderParameters;

#pragma mark - Заявки займодавца

- (NSURLRequest *)requestForLenderOrdersWithPage:(NSUInteger)page
									  sortMethod:(QLSortMethod)sortMethod
									   ascending:(BOOL)ascending;

- (NSURLRequest *)requestForLenderOrderWithId:(NSInteger)orderId;

- (NSURLRequest *)requestForAddingLenderOrder:(NSDictionary *)orderParameters;

#pragma mark - Информация о пользователе

- (NSURLRequest *)requestForCurrentUser;

- (NSURLRequest *)requestForUserWithId:(NSUInteger)userId;

#pragma mark - Направление запросов

- (NSURLRequest *)requestForLoanProvision:(NSInteger)orderId;

- (NSURLRequest *)requestForLoanReceipt:(NSInteger)orderId;

- (NSURLRequest *)requestForLoanConfirmation:(NSInteger)orderId;

- (NSURLRequest *)provideLoanRequest:(NSInteger)orderId;

- (NSURLRequest *)requestForOrderDeactivation:(NSInteger)orderId;

- (NSURLRequest *)requestForPaymentCompletion:(NSDictionary *)orderParameters;

@end
