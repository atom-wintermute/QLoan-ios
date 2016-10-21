//
//  QLBankCardMapperImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankCardMapperImplementation.h"

#import "EasyMapping.h"

#import "QLBankMappingProvider.h"

@implementation QLBankCardMapperImplementation

- (NSArray<QLBankCard *> *)mapBankCardListFromResponseObject:(id)responseObject {
    if (!responseObject) {
        return nil;
    }
    
    EKObjectMapping *userMapping = [QLBankMappingProvider bankCard];
    return [EKMapper objectFromExternalRepresentation:responseObject
                                          withMapping:userMapping];
}

@end
