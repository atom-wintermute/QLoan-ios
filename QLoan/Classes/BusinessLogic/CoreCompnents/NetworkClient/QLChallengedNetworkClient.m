//
//  ChallengedNetworkClient.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLChallengedNetworkClient.h"

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

- (void)URLSession:(NSURLSession *)session
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition,
							 NSURLCredential * _Nullable credential))completionHandler {
	completionHandler(NSURLSessionAuthChallengeUseCredential,
					  [NSURLCredential credentialForTrust:[challenge protectionSpace].serverTrust]);
}

@end
