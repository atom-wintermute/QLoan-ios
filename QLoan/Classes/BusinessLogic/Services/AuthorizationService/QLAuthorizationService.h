//
//  QLAuthorizationService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServicesConstants.h"

@protocol QLStorage;

@class QLRegistrationRequestConfiguration;
@class QLAuthorizationRequestConfiguration;
@class QLBorrowerOrder;
@class QLRequestFactory;
@class QLNetworkClient;
@class QLJSONSerializer;
@class QLMapper;
@class QLKeychainStorage;

@interface QLAuthorizationService : NSObject <NSURLSessionDelegate>

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) QLMapper *mapper;
@property (nonatomic, strong) QLRequestFactory *requestFactory;
@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, strong) QLJSONSerializer *serializer;

/**
 Метод signUp
 */
- (void)registerWithConfiguration:(QLRegistrationRequestConfiguration *)configuration
					   completion:(QLBooleanCompletion)completion;

/**
 Метод signIn
 */
- (void)authorizeWithConfiguration:(QLAuthorizationRequestConfiguration *)configuration
						completion:(QLBooleanCompletion)completion;

@end
