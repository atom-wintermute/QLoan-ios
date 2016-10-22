//
//  QLBankAuthRequestFactory.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

/**
 Протокол фабрики запросов для сервиса авторизации в платформе банка Открытия
 */
@protocol QLBankAuthRequestFactory <NSObject>

/**
 Запрос на авторизацию

 @param login    логин пользователя (номер телефона)
 @param password пароль пользователя

 @return запрос
 */
- (NSURLRequest *)requestForLoginWithLogin:(NSString *)login
                                  password:(NSString *)password;

- (NSURLRequest *)requestForRegisterWithPhoneNumber:(NSString *)phoneNumber;

- (NSURLRequest *)requestForVerifyWithCode:(NSString *)code
                                 sessionId:(NSString *)sessionId;

- (NSURLRequest *)requestForEditUserWithEmail:(NSString *)email
                                    firstName:(NSString *)firstName
                                   secondName:(NSString *)secondName
                                    sessionId:(NSString *)sessionId;

- (NSURLRequest *)requestForChangePasswordWithPassword:(NSString *)password
                                             sessionId:(NSString *)sessionId;

/**
 Запрос на получение данных текущего пользователя
 
 @param sessionId текущая сессия

 @return запрос
 */
- (NSURLRequest *)requestForCurrentUserDataWithSessionId:(NSString *)sessionId;

@end
