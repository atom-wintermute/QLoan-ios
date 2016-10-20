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

@class QLNetworkClient;

@interface QLBankAuthServiceImplementation : NSObject <QLBankAuthService>

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) id<QLBankAuthRequestFactory> requestFactory;

@end
