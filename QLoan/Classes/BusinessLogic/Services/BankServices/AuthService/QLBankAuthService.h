//
//  QLBankAuthService.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@class QLBankUserInfo;

typedef void(^QLBankAuthLoginCompletion)(BOOL success, NSError *error);
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
            completion:(QLBankAuthLoginCompletion)completion;

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

@end
