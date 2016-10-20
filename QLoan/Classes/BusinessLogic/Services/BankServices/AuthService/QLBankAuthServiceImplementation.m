//
//  QLBankAuthServiceImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankAuthServiceImplementation.h"

#import "QLNetworkClient.h"
#import "QLBankAuthRequestFactory.h"
#import "QLServerResponse.h"

@implementation QLBankAuthServiceImplementation

- (void)loginWithLogin:(NSString *)login
              password:(NSString *)password
            completion:(QLBankAuthLoginCompletion)completion {
    NSURLRequest *URLRequest = [self.requestFactory requestForLoginWithLogin:login
                                                                    password:password];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             
                         }];
}

@end
