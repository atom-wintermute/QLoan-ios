//
//  QLBankAuthMapper.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@class QLBankUserInfo;

/**
 Протокол маппера для сервиса авторизации в банковской платформе
 */
@protocol QLBankAuthMapper <NSObject>

/**
 Маппит модель пользователя банка

 @param responseObject сырые данные

 @return модель пользователя банка
 */
- (QLBankUserInfo *)mapBankUserInfoFromResponseObject:(id)responseObject;

@end
