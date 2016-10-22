//
//  QLBankServiceConstants.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankServiceConstants.h"

#pragma mark - End-point-ы

NSString * const QLBankRegister = @"register.do";
NSString * const QLBankCompleteRegistration = @"completeRegistration.do";
NSString * const QLBankChangeUser = @"changeUser.do";
NSString * const QLBankChangePassword = @"changePassword.do";
NSString * const QLBankAuthenticate = @"authenticate.do";
NSString * const QLBankLogout = @"logout.do";
NSString * const QLBankGetUser = @"getUser.do";

NSString * const QLBankGetBindings = @"getBindings.do";
NSString * const QLBankCreateVerifyPayment = @"createVerifyPayment.do";

#pragma mark - Параметры запросов



#pragma mark - Ключи ответов

NSString * const QLBankErrorCode = @"errorCode";
NSString * const QLBankSessionId = @"sessionId";
NSString * const QLBankUserId = @"userId";

#pragma mark - Ключи данных в хранилищах

NSString * const QLBankSessionIdKey = @"bankSessionIdKey";
NSString * const QLBankUserInfoKey = @"bankUserInfoKey";
NSString * const QLBanFacebookKey = @"bankFacebookKey";
NSString * const QLBankCardsKey = @"bankCardsKey";
