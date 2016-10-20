//
//  QLAuthorizationService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServicesConstants.h"

@class QLRegistrationRequestConfiguration;
@class QLAuthorizationRequestConfiguration;
@class QLBorrowerOrder;
@class QLRequestFactory;
@class QLNetworkClient;
@class QLJSONSerializer;
@class QLMapper;
@class QLKeychainStorage;

@interface QLAuthorizationService : NSObject

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) QLMapper *mapper;
@property (nonatomic, strong) QLRequestFactory *requestFactory;
@property (nonatomic, strong) QLKeychainStorage *storage;

/**
 Метод signUp
 */
- (void)registerWithConfiguration:(QLRegistrationRequestConfiguration *)configuration
					   completion:(QLBooleanCompletion)completion;

/**
 Метод signIn
 */
- (void)authorizeWithCompletion:(QLBooleanCompletion)completion;

@end
