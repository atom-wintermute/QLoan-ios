//
//  QLBankCardRequestFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankCardRequestFactoryImplementation.h"

@implementation QLBankCardRequestFactoryImplementation

- (NSURLRequest *)requestForUpdateBankCardListWithSessionId:(NSString *)sessionId {
    NSString *path = QLBankGetBindings;
    NSDictionary *parameters = @{
                                 @"sessionId": sessionId,
                                 @"isMobile": @YES
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

- (NSURLRequest *)requestForAddBankCardWithSessionId:(NSString *)sessionId
                                                 pan:(NSString *)pan
                                                 cvc:(NSString *)cvc
                                          expiryDate:(NSString *)expiryDate
                                        mnemonicName:(NSString *)mnemonicName {
    NSString *path = QLBankCreateVerifyPayment;
    NSDictionary *parameters = @{
                                 @"sessionId": sessionId,
                                 @"isMobile": @YES,
                                 @"pan": pan,
                                 @"cvc": cvc,
                                 @"expiry": expiryDate,
                                 @"mnemonic": mnemonicName
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

#pragma mark - Приватные методы

- (NSString *)urlStringWithPath:(NSString *)path {
    NSURL *baseUrl = [NSURL URLWithString:QLBankServerBasePath];
    return [[NSURL URLWithString:path relativeToURL:baseUrl] absoluteString];
}

@end
