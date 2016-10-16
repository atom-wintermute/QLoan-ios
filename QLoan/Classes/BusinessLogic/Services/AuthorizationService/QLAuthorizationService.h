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

@interface QLAuthorizationService : NSObject

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
