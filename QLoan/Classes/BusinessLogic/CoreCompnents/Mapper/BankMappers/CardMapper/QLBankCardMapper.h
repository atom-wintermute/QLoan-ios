//
//  QLBankCardMapper.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@class QLBankCard;

/**
 Протокол маппера банковских карт
 */
@protocol QLBankCardMapper <NSObject>

/**
 Маппит список банковских карт

 @param responseObject сырые данные

 @return массив банковских карт
 */
- (NSArray <QLBankCard *> *)mapBankCardListFromResponseObject:(id)responseObject;

@end
