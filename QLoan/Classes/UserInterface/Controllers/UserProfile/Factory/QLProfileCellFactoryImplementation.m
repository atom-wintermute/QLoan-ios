//
//  QLProfileCellFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileCellFactoryImplementation.h"

#import "QLProfileDataCellObject.h"

#import "QLBankUserInfo.h"

@implementation QLProfileCellFactoryImplementation

- (NSArray *)cellObjectsFrom:(QLBankUserInfo *)bankUserInfo {
    NSMutableArray *cellObjects = [NSMutableArray new];
    
    QLProfileDataCellObject *phoneCellObject = [QLProfileDataCellObject new];
    phoneCellObject.nameString = @"Телефон";
    phoneCellObject.valueString = [NSString stringWithFormat:@"+ 7 %@", bankUserInfo.phoneNumber];
    [cellObjects addObject:phoneCellObject];
    
    QLProfileDataCellObject *emailCellObject = [QLProfileDataCellObject new];
    emailCellObject.nameString = @"Почта";
    emailCellObject.valueString = bankUserInfo.email;
    [cellObjects addObject:emailCellObject];
    
    QLProfileDataCellObject *loanTakenCellObject = [QLProfileDataCellObject new];
    loanTakenCellObject.nameString = @"Выдано займов";
    loanTakenCellObject.valueString = @"10";
    [cellObjects addObject:loanTakenCellObject];
    
    QLProfileDataCellObject *loanLendedCellObject = [QLProfileDataCellObject new];
    loanLendedCellObject.nameString = @"Взято займов";
    loanLendedCellObject.valueString = @"1";
    [cellObjects addObject:loanLendedCellObject];
    
    return [cellObjects copy];
}

@end
