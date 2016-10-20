//
//  QLNetworkClient.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesConstants.h"

@interface QLNetworkClient : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (void)sendRequest:(NSURLRequest *)request
		 completion:(QLNetworkCompletion)completion;

@end
