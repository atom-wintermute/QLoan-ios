//
//  QLBankServiceConstants.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankServiceConstants.h"

#pragma mark - End-point-ы

NSString * const QLBankAuthenticate = @"authenticate.do";
NSString * const QLBankGetUser = @"getUser.do";
NSString * const QLBankGetBindings = @"getBindings.do";

#pragma mark - Параметры запросов



#pragma mark - Ключи ответов

NSString * const QLBankErrorCode = @"errorCode";
NSString * const QLBankSessionId = @"sessionId";
NSString * const QLBankUserId = @"userId";

#pragma mark - Ключи данных в хранилищах

NSString * const QLBankSessionIdKey = @"bankSessionIdKey";
NSString * const QLBankUserInfoKey = @"bankUserInfoKey";
NSString * const QLBankCardsKey = @"bankCardsKey";
