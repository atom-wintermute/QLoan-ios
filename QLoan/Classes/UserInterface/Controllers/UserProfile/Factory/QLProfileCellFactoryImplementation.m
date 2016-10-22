//
//  QLProfileCellFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileCellFactoryImplementation.h"

#import "QLProfileDataCellObject.h"
#import "QLProfileCardCellObject.h"
#import "QLProfileAddCardCellObject.h"
#import "QLOffsetCellObject.h"
#import "QLProfileLogoutCellObject.h"

#import "QLBankUserInfo.h"
#import "QLBankCard.h"

@implementation QLProfileCellFactoryImplementation

- (NSArray *)cellObjectsFrom:(QLBankUserInfo *)bankUserInfo
                    cardList:(NSArray<QLBankCard *> *)cardList
                    delegate:(id<QLProfileViewDelegate>)delegate {
    NSMutableArray *cellObjects = [NSMutableArray new];
    
    QLProfileDataCellObject *phoneCellObject = [QLProfileDataCellObject new];
    phoneCellObject.nameString = @"Телефон";
    phoneCellObject.valueString = [NSString stringWithFormat:@"+ 7 %@", bankUserInfo.phoneNumber];
    [cellObjects addObject:phoneCellObject];
    
    QLProfileDataCellObject *emailCellObject = [QLProfileDataCellObject new];
    emailCellObject.nameString = @"Почта";
    emailCellObject.valueString = bankUserInfo.email;
    [cellObjects addObject:emailCellObject];
    
    QLOffsetCellObject *cardOffsetCellObject = [QLOffsetCellObject new];
    cardOffsetCellObject.cellHeight = 8.0;
    [cellObjects addObject:cardOffsetCellObject];
    
    QLProfileAddCardCellObject *addCardCellObject = [QLProfileAddCardCellObject new];
    [cellObjects addObject:addCardCellObject];
    
    if (cardList.count) {
        for (QLBankCard *card in cardList) {
            QLProfileCardCellObject *cardCellObject = [QLProfileCardCellObject new];
            if (card.maskedPan) {
                cardCellObject.cardNameString = [NSString stringWithFormat:@"%@ %@", card.mnemonicName, card. maskedPan];
            } else {
                cardCellObject.cardNameString = [NSString stringWithFormat:@"%@", card.mnemonicName];
            }
            if (card.balance > 0.0) {
                cardCellObject.balanceString = [NSString stringWithFormat:@"%f ₽", card.balance];
            } else {
                cardCellObject.balanceString = @"";
            }
            [cellObjects addObject:cardCellObject];
        }
    }
    
    QLOffsetCellObject *loanOffsetCellObject = [QLOffsetCellObject new];
    loanOffsetCellObject.cellHeight = 8.0;
    [cellObjects addObject:loanOffsetCellObject];
    
    QLProfileDataCellObject *loanTakenCellObject = [QLProfileDataCellObject new];
    loanTakenCellObject.nameString = @"Выдано займов";
    loanTakenCellObject.valueString = @"10";
    [cellObjects addObject:loanTakenCellObject];
    
    QLProfileDataCellObject *loanLendedCellObject = [QLProfileDataCellObject new];
    loanLendedCellObject.nameString = @"Взято займов";
    loanLendedCellObject.valueString = @"1";
    [cellObjects addObject:loanLendedCellObject];
    
    QLProfileLogoutCellObject *logoutCellObject = [QLProfileLogoutCellObject new];
    logoutCellObject.delegate = delegate;
    [cellObjects addObject:logoutCellObject];
    
    return [cellObjects copy];
}

@end
