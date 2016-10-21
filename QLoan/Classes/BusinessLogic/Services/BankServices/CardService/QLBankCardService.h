//
//  QLBankCardService.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@class QLBankCard;

typedef void(^QLBankCardCompletion)(NSArray <QLBankCard *> *cards, NSError *error);

/**
 Протокол для работы с банковскими картами
 */
@protocol QLBankCardService <NSObject>

/**
 Обновить список карт для текущего пользователя
 
 @param completion завершающий блок
 */
- (void)updateBankCardsWithCompletion:(QLBankCardCompletion)completion;

/**
 Получить список карт синхронно их кэша
 
 @return массив привязанных банковских карт
 */
- (NSArray <QLBankCard *> *)obtainBankCards;

@end
