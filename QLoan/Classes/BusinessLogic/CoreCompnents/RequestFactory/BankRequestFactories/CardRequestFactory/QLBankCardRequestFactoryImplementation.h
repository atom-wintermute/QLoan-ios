//
//  QLBankCardRequestFactoryImplementation.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLBankCardRequestFactory.h"

#import <AFHTTPRequestOperation.h>

@interface QLBankCardRequestFactoryImplementation : NSObject <QLBankCardRequestFactory>

@property (nonatomic, strong) AFHTTPRequestSerializer *requestSerializer;

@end
