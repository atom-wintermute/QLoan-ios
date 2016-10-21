//
//  QLBankMappingProvider.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankMappingProvider.h"

#import <EasyMapping/EasyMapping.h>

#import "QLBankUserInfo.h"
#import "QLBankCard.h"

@implementation QLBankMappingProvider

+ (EKObjectMapping *)bankUserInfo {
    return [EKObjectMapping mappingForClass:[QLBankUserInfo class]
                                  withBlock:^(EKObjectMapping *mapping) {
                                      [mapping mapFieldsFromDictionary:@{
                                                                         @"phone": @"phoneNumber",
                                                                         @"email": @"email",
                                                                         @"firstName": @"firstName",
                                                                         @"secondName": @"secondName",
                                                                         @"lastName": @"lastName"
                                                                         }];
                                  }];
}

+ (EKObjectMapping *)bankCard {
    return [EKObjectMapping mappingForClass:[QLBankCard class]
                                  withBlock:^(EKObjectMapping *mapping) {
                                      [mapping mapFieldsFromDictionary:@{
                                                                         @"bindingId": @"cardId",
                                                                         @"mnemonic": @"mnemonicName",
                                                                         @"maskenPan": @"maskenPan",
                                                                         @"balance": @"balance"
                                                                         }];
                                  }];
}

@end
