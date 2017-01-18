//
//  ChallengedNetworkClient.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLChallengedNetworkClient.h"

#import "QLNetworkClient.h"
#import "QLServerResponse.h"

@implementation QLChallengedNetworkClient

- (instancetype)init {
	self = [super init];
	if (self) {
		self.session = [NSURLSession sessionWithConfiguration:nil
													 delegate:self
												delegateQueue:[NSOperationQueue mainQueue]];
	}
	
	return self;
}

- (void)sendRequest:(NSURLRequest *)request
		 completion:(QLNetworkCompletion)completion {
	NSAssert(request != nil, @"NSURLRequest не должен быть пустым");
	NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request
													 completionHandler:^(NSData *data,
																		 NSURLResponse *response,
																		 NSError *error) {
														 if (completion) {
															 NSHTTPURLResponse *serverResponse = nil;
															 if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
																 serverResponse = (NSHTTPURLResponse *)response;
																 
																 if (serverResponse.statusCode >= 400) {
																	 NSError *serverError =
																	 [self errorWithStatusCode:serverResponse.statusCode];
																	 completion(nil, serverError);
																	 
																	 return;
																 }
															 }
															 QLServerResponse *response = [QLServerResponse new];
															 response.data = data;
															 response.response = serverResponse;
															 
															 completion(response, error);
														 }
													 }];
	
	[dataTask resume];
}

- (void)URLSession:(NSURLSession *)session
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition,
							 NSURLCredential * _Nullable credential))completionHandler {
	completionHandler(NSURLSessionAuthChallengeUseCredential,
					  [NSURLCredential credentialForTrust:[challenge protectionSpace].serverTrust]);
}

- (NSError *)errorWithStatusCode:(NSInteger)statusCode {
	NSError *error = [NSError errorWithDomain:NSURLErrorDomain
										 code:statusCode
									 userInfo:nil];
	
	return error;
}

@end
