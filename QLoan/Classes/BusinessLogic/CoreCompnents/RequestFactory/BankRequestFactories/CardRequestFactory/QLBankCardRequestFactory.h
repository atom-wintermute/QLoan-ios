//
//  QLBankCardRequestFactory.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

/**
 Протокол фабрики запросов для работы с банковскими картами
 */
@protocol QLBankCardRequestFactory <NSObject>

/**
 Запрос на получение списка привязанных банковских карт

 @param sessionId id текущей сессии

 @return запрос
 */
- (NSURLRequest *)requestForUpdateBankCardListWithSessionId:(NSString *)sessionId;

@end
