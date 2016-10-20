//
//  QLAuthorizationService.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAuthorizationService.h"
#import "QLRequestFactory.h"
#import "QLNetworkClient.h"
#import "QLMapper.h"
#import "QLJSONSerializer.h"
#import "QLServerResponse.h"
#import "QLKeychainStorage.h"
#import "ErrorCodes.h"

@implementation QLAuthorizationService

- (void)registerWithConfiguration:(QLRegistrationRequestConfiguration *)configuration
					   completion:(QLBooleanCompletion)completion {
	NSURLRequest *request = [self.requestFactory requestForRegistrationWithConfiguration:configuration];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			if ([response.response respondsToSelector:@selector(allHeaderFields)]) {
				NSDictionary *dictionary = [response.response allHeaderFields];
				QLSessionCredentials *credentials = [strongSelf.mapper mapSessionCredentialsFromResponseObject:dictionary];
				[self.storage setCredentialsForCurrentUser:credentials];
				
				run_block_on_main(completion, YES, nil);
			} else {
				NSError *error = [NSError errorWithDomain:NSURLErrorDomain
													 code:QLErrorCodeNoHTTPHeaders
												 userInfo:nil];
				run_block_on_main(completion, nil, error);
			}
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)authorizeWithCompletion:(QLBooleanCompletion)completion {
	QLAuthorizationRequestConfiguration *configuration = [self.storage authorizationConfigurationForCurrentUser];
	NSURLRequest *request = [self.requestFactory requestForAuthorizationWithConfiguration:configuration];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			if ([response.response respondsToSelector:@selector(allHeaderFields)]) {
				NSDictionary *dictionary = [response.response allHeaderFields];
				
				QLSessionCredentials *credentials = [strongSelf.mapper mapSessionCredentialsFromResponseObject:dictionary];
				[self.storage setCredentialsForCurrentUser:credentials];
				run_block_on_main(completion, YES, nil);
			} else {
				NSError *error = [NSError errorWithDomain:NSURLErrorDomain
													 code:QLErrorCodeNoHTTPHeaders
												 userInfo:nil];
				run_block_on_main(completion, nil, error);
			}
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

@end
