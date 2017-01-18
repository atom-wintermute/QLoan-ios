//
//  QLBankAuthService.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@class QLBankUserInfo;

typedef void(^QLBankAuthCompletion)(BOOL success, NSError *error);
typedef void(^QLBankAuthUserDataCompletion)(QLBankUserInfo *userInfo, NSError *error);

/**
 Протокол авторизации/регистрации в платформе банка Открытие
 */
@protocol QLBankAuthService <NSObject>

/**
 Авторизация

 @param login      номер телефона, используемый в качестве логина
 @param password   пароль
 @param completion завершающий блок
 */
- (void)loginWithLogin:(NSString *)login
              password:(NSString *)password
            completion:(QLBankAuthCompletion)completion;

- (void)logoutCurrentUser:(QLBankAuthCompletion)completion;

- (void)registerWithPhoneNumber:(NSString *)phoneNumber
                     completion:(QLBankAuthCompletion)completion;

- (void)verifyPhoneNumberWithCode:(NSString *)code
                       completion:(QLBankAuthCompletion)completion;

- (void)editUserDataWithEmail:(NSString *)email
                    firstName:(NSString *)firstName
                     lastName:(NSString *)lastName
                   completion:(QLBankAuthCompletion)completion;

- (void)editUserDataWithEmail:(NSString *)email
                    firstName:(NSString *)firstName
                     lastName:(NSString *)lastName
                       avatar:(NSData *)avatar
                   completion:(QLBankAuthCompletion)completion;

- (void)changePasswordWithPassword:(NSString *)password
                        completion:(QLBankAuthCompletion)completion;

/**
 Получение данных текущего пользователя

 @param completion завершающий блок
 */
- (void)updateCurrentUserDataWithCompletion:(QLBankAuthUserDataCompletion)completion;

/**
 Получить данные текущего пользователя синхронно из хранилища

 @return модель текущего пользователя платформы банка Открытие
 */
- (QLBankUserInfo *)obtainCurrentUserData;

- (void)addFacebookEntire;

- (BOOL)obtainFacebookEntire;

@end
