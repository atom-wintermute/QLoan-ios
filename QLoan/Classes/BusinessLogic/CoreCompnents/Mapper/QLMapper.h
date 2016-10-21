//
//  QLMapper.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLMappingProvider.h"
#import "QLSessionCredentials.h"

@interface QLMapper : NSObject

@property (nonatomic, strong) QLMappingProvider *mappingProvider;

#pragma mark - Заявки Заемщика

- (QLBorrowerOrder *)mapBorrowerOrderFromResponseObject:(id)responseObject;

- (NSArray<QLBorrowerOrder *> *)mapBorrowerOrdersFromResponseObject:(id)responseObject;

#pragma mark - Заявки Займодавца

- (QLLenderOrder *)mapLenderOrderFromResponseObject:(id)responseObject;

- (NSArray<QLLenderOrder *> *)mapLenderOrdersFromResponseObject:(id)responseObject;

#pragma mark - Нотификации

- (QLNotification *)mapNotificationFromResponseObject:(id)responseObject;

- (NSArray<QLNotification *> *)mapNotificationsFromResponseObject:(id)responseObject;

#pragma mark - Платежи

- (QLPaymentSchedule *)mapPaymentScheduleFromResponseObject:(id)responseObject;

#pragma mark - Данные сессии

- (QLSessionCredentials *)mapSessionCredentialsFromResponseObject:(id)responseObject;

@end
