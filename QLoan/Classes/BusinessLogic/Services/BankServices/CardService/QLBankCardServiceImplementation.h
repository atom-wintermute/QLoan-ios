//
//  QLBankCardServiceImplementation.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLBankCardService.h"

@protocol QLStorage;
@protocol QLBankCardRequestFactory;
@protocol QLBankCardMapper;

@class QLNetworkClient;

@interface QLBankCardServiceImplementation : NSObject <QLBankCardService>

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) id<QLBankCardRequestFactory> requestFactory;
@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, strong) id<QLBankCardMapper> mapper;

@end
