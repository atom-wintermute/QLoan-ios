//
//  QLBankServiceConstants.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#pragma mark - End-point-ы

extern NSString * const QLBankRegister;
extern NSString * const QLBankCompleteRegistration;
extern NSString * const QLBankChangeUser;
extern NSString * const QLBankChangePassword;
extern NSString * const QLBankAuthenticate;
extern NSString * const QLBankLogout;
extern NSString * const QLBankGetUser;

extern NSString * const QLBankGetBindings;
extern NSString * const QLBankCreateVerifyPayment;

#pragma mark - Параметры запросов



#pragma mark - Ключи ответов

extern NSString * const QLBankErrorCode;
extern NSString * const QLBankSessionId;
extern NSString * const QLBankUserId;

#pragma mark - Ключи данных в хранилищах

extern NSString * const QLBankSessionIdKey;
extern NSString * const QLBankUserInfoKey;
extern NSString * const QLBanFacebookKey;
extern NSString * const QLBankCardsKey;
