//
//  QLBankAuthMapperImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankAuthMapperImplementation.h"

#import "EasyMapping.h"

#import "QLBankMappingProvider.h"

@implementation QLBankAuthMapperImplementation

- (QLBankUserInfo *)mapBankUserInfoFromResponseObject:(id)responseObject {
    if (!responseObject) {
        return nil;
    }
    
    EKObjectMapping *userMapping = [QLBankMappingProvider bankUserInfo];
    return [EKMapper objectFromExternalRepresentation:responseObject
                                          withMapping:userMapping];
}

@end
