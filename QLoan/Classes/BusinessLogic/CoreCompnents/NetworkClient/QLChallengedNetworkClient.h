//
//  ChallengedNetworkClient.h
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLNetworkClient.h"

@interface QLChallengedNetworkClient : QLNetworkClient<NSURLSessionDelegate>

- (instancetype)init;

@end
