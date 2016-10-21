//
//  QLBankCardServiceImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankCardServiceImplementation.h"

#import "QLBankCardRequestFactory.h"
#import "QLBankCardMapper.h"
#import "QLStorage.h"
#import "QLNetworkClient.h"

#import "QLServerResponse.h"

@implementation QLBankCardServiceImplementation

- (void)updateBankCardsWithCompletion:(QLBankCardCompletion)completion {
    NSString *sessionId = [self.storage loadObjectForKey:QLBankSessionIdKey];
    NSURLRequest *URLRequest = [self.requestFactory requestForUpdateBankCardListWithSessionId:sessionId];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, nil, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             NSLog(@"responseData = %@", responseData);
                         }];
}

- (NSArray<QLBankCard *> *)obtainBankCards {
    return @[];
}

@end
