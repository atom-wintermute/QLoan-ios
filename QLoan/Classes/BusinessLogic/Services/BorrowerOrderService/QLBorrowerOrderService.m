//
//  QLBorrowerOrderService.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBorrowerOrderService.h"
#import "QLRequestFactory.h"
#import "QLNetworkClient.h"
#import "QLMapper.h"
#import "QLJSONSerializer.h"
#import "QLServerResponse.h"

#import <objc/runtime.h>
#import <OHHTTPStubs.h>

@implementation QLBorrowerOrderService

- (void)borrowerOrderWithId:(NSInteger)orderId
				 completion:(QLBorrowerOrderCompletion)completion {
	[self createServiceStubs];
	NSURLRequest *request = [self.requestFactory requestForBorrowerOrderWithId:orderId];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			id responseObject = [strongSelf.serializer jsonObjectFromResponse:response];
			QLBorrowerOrder *order = [strongSelf.mapper mapBorrowerOrderFromResponseObject:responseObject];
			run_block_on_main(completion, order, nil);
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

#pragma mark - Service stubs

- (void)createServiceStubs {
	[OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
		return [request.URL.absoluteString containsString:QLLocalServerBasePath];
	}
						withStubResponse:^OHHTTPStubsResponse *_Nonnull(NSURLRequest *request)
	 {
		 NSString *fixture = [self pathForFile:@"borrowerOrderStub.json" class:self.class];
		 return [OHHTTPStubsResponse responseWithFileAtPath:fixture
												 statusCode:200
													headers:@{
															  @"Content-Type" : @"application/json"
															  }];
	 }];
}
	 
- (NSString*)pathForFile:(NSString*)fileName class:(Class)inBundleForClass
{
	NSBundle* bundle = [NSBundle bundleForClass:inBundleForClass];
	return [self pathForFileInBundle:fileName bundle:bundle];
}
	 
- (NSString *)pathForFileInBundle:(NSString*) fileName bundle:(NSBundle*)bundle
{
	return [bundle pathForResource:[fileName stringByDeletingPathExtension]
							ofType:[fileName pathExtension]];
}

@end
	 
	 
