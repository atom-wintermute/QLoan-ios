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

@end
