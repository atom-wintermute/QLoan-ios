//
//  QLNetworkClient.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLNetworkClient.h"
#import "QLServerResponse.h"

@implementation QLNetworkClient

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
			}
			QLServerResponse *response = [QLServerResponse new];
			response.data = data;
			response.response = serverResponse;
			
			completion(response, error);
		}
	}];
	
	[dataTask resume];
}

@end
