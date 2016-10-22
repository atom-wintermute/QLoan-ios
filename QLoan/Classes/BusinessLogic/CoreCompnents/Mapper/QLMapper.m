//
//  QLMapper.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMapper.h"

@implementation QLMapper

#pragma mark - Заявки Заемщика

- (QLBorrowerOrder *)mapBorrowerOrderFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider borrowerOrderMapping];
	QLBorrowerOrder *order = [EKMapper objectFromExternalRepresentation:responseObject
															withMapping:mapping];
	
	return order;
}

- (NSArray<QLBorrowerOrder *> *)mapBorrowerOrdersFromResponseObject:(id)responseObject {
	if ([responseObject isKindOfClass:[NSArray class]]) {
		NSArray *responseArray = (NSArray *)responseObject;
		return [EKMapper arrayOfObjectsFromExternalRepresentation:responseArray
													  withMapping:[self.mappingProvider borrowerOrderMapping]];
	}
	return nil;
}

#pragma mark - Заявки Займодавца

- (QLLenderOrder *)mapLenderOrderFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider lenderOrderMapping];
	QLLenderOrder *order = [EKMapper objectFromExternalRepresentation:responseObject
															withMapping:mapping];
	
	return order;
}

- (NSArray<QLLenderOrder *> *)mapLenderOrdersFromResponseObject:(id)responseObject {
	
	if ([responseObject isKindOfClass:[NSDictionary class]]) {
		NSDictionary *responseDictionary = responseObject;
		
		if ([responseDictionary[@"orders"] isKindOfClass:[NSArray class]]) {
			NSArray *objects = responseDictionary[@"orders"];
			NSMutableArray *mappedArray = [NSMutableArray array];
			
			[objects enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
				QLLenderOrder *order = [self mapLenderOrderFromResponseObject:object];
				if (order != nil) {
					[mappedArray addObject:order];
				}
			}];
			
			return [mappedArray copy];
		}
	}
	return nil;
}

#pragma mark - Нотификации

- (QLNotification *)mapNotificationFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider notificationMapping];
	QLNotification *notification = [EKMapper objectFromExternalRepresentation:responseObject
																  withMapping:mapping];
	
	return notification;
}

- (NSArray<QLNotification *> *)mapNotificationsFromResponseObject:(id)responseObject {
	
	if ([responseObject isKindOfClass:[NSDictionary class]]) {
		NSDictionary *responseDictionary = responseObject;
		
		if ([responseDictionary[@"notifications"] isKindOfClass:[NSArray class]]) {
			NSArray *notifications = responseDictionary[@"notifications"];
			NSMutableArray *mappedArray = [NSMutableArray array];
			
			[notifications enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
				QLNotification *notification = [self mapNotificationFromResponseObject:object];
				if (notification != nil) {
					[mappedArray addObject:notification];
				}
			}];
			
			return [mappedArray copy];
		}
	}
	return nil;
}

#pragma mark - Платежи

- (QLPaymentSchedule *)mapPaymentScheduleFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider paymentScheduleMapping];
	QLPaymentSchedule *schedule = [EKMapper objectFromExternalRepresentation:responseObject
																 withMapping:mapping];
	
	return schedule;
}

#pragma mark - Информация о пользователе

- (QLUserInfo *)mapUserInfoFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider userInfoMapping];
	QLUserInfo *info = [EKMapper objectFromExternalRepresentation:responseObject
													  withMapping:mapping];
	
	return info;
}

- (NSArray<QLUserInfo *> *)mapUserInfosFromResponseObject:(id)responseObject {
	if ([responseObject isKindOfClass:[NSDictionary class]]) {
		NSDictionary *responseDictionary = responseObject;
		if ([responseDictionary[@"users"] isKindOfClass:[NSArray class]]) {
			NSArray *objects = responseDictionary[@"users"];
			return [EKMapper arrayOfObjectsFromExternalRepresentation:objects
														  withMapping:[self.mappingProvider userInfoMapping]];
		}
	}

	return nil;
}


#pragma mark - Данные сессии

- (QLSessionCredentials *)mapSessionCredentialsFromResponseObject:(id)responseObject {
	EKObjectMapping *mapping = [self.mappingProvider authorizationHeaderMapping];
	QLSessionCredentials *credentials = [EKMapper objectFromExternalRepresentation:responseObject
																	   withMapping:mapping];
	
	return credentials;
}

@end
