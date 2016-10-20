//
//  QLBankAuthServiceImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankAuthServiceImplementation.h"

#import "QLNetworkClient.h"
#import "QLJSONSerializer.h"
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
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             if (![responseData[QLBankErrorCode] integerValue]) {
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 run_block_on_main(completion, NO, nil);
                             }
                         }];
}

@end
