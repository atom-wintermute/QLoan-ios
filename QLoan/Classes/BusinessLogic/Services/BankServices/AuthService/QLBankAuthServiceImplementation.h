//
//  QLBankAuthServiceImplementation.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLBankAuthService.h"

@protocol QLBankAuthRequestFactory;
@protocol QLStorage;
@protocol QLBankAuthMapper;

@class QLNetworkClient;
@class QLJSONSerializer;

@interface QLBankAuthServiceImplementation : NSObject <QLBankAuthService>

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) id<QLBankAuthRequestFactory> requestFactory;
@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, strong) id<QLBankAuthMapper> mapper;

@end
