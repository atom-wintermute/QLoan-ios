//
//  QLKeychainStorage.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLStorage.h"
#import "QLSessionCredentials.h"
#import "QLAuthorizationRequestConfiguration.h"

@interface QLKeychainStorage : NSObject <QLStorage>

- (QLSessionCredentials *)credentialsForCurrentUser;

- (void)setCredentialsForCurrentUser:(QLSessionCredentials *)credentials;

- (QLAuthorizationRequestConfiguration *)authorizationConfigurationForCurrentUser;

- (void)setAuthorizationConfiguration:(QLAuthorizationRequestConfiguration *)configuration;

@end
