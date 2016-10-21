//
//  QLBankAuthRequestFactoryImplementation.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLBankAuthRequestFactory.h"

#import <AFHTTPRequestOperation.h>

@interface QLBankAuthRequestFactoryImplementation : NSObject <QLBankAuthRequestFactory>

@property (nonatomic, strong) AFHTTPRequestSerializer *requestSerializer;

@end
