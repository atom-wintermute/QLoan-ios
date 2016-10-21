//
//  QLBankCard.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Модель банковской карты
 */
@interface QLBankCard : NSObject

@property (nonatomic, strong) NSString *cardId;
@property (nonatomic, strong) NSString *mnemonicName;
@property (nonatomic, strong) NSString *maskedPan;
@property (nonatomic) CGFloat balance;

@end
