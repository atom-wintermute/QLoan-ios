//
//  QLUserInfoService.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLUserInfoService.h"
#import "QLRequestFactory.h"
#import "QLNetworkClient.h"
#import "QLMapper.h"
#import "QLJSONSerializer.h"
#import "QLServerResponse.h"
#import "QLSerializer.h"

@implementation QLUserInfoService

- (void)infoForCurrentUserWithCompletion:(QLUserInfoCompletionBlock)completion {
	NSURLRequest *request = [self.requestFactory requestForCurrentUser];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			id responseObject = [strongSelf.jsonSerializer jsonObjectFromResponse:response];
			QLUserInfo *info = [strongSelf.mapper mapUserInfoFromResponseObject:responseObject];
			run_block_on_main(completion, info, nil);
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)infoForUserWithId:(NSInteger)userId
			   completion:(QLUserInfoCompletionBlock)completion {
	NSURLRequest *request = [self.requestFactory requestForUserWithId:userId];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			id responseObject = [strongSelf.jsonSerializer jsonObjectFromResponse:response];
			QLUserInfo *info = [strongSelf.mapper mapUserInfoFromResponseObject:responseObject];
			run_block_on_main(completion, info, nil);
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

@end
