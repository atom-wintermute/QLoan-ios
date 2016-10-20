//
//  QLBankAuthRequestFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankAuthRequestFactoryImplementation.h"

@implementation QLBankAuthRequestFactoryImplementation

- (NSURLRequest *)requestForLoginWithLogin:(NSString *)login
                                  password:(NSString *)password {
    NSString *path = QLBankAuthenticate;
    NSDictionary *parameters = @{
                                 @"username": login,
                                 @"password": password,
                                 @"uniqueDeviceId": @"12345",
                                 @"osType": @"iOS",
                                 @"appVersion": @"1.0",
                                 @"timezone": @"0",
                                 @"deviceModel": @"iPhone",
                                 @"osVersion": @"9.3"
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
